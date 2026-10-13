use context dcic2024
include csv
include data-source

#| 
   plan a task before coding it
   finding and cleaning dirty data
   visualization
|#

#|
   task plan is a to do list that you can check off
   input = the colums you start from
   output= a concrete example of what you want at the end
   steps = small enough that eeach one is a single function or table operation
   tools = the operation fore ach step: filter-with, transform-column
|#

#load voters data
voter-data = load-table: VoterID, DOB, Party, Address, City, County, Postcode
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/voters.csv", default-options)
end
voter-data.row-n(0)["VoterID"]

#confirm the party problem
filter-with(voter-data, lam(r): r["Party"] == "Labour" end).length() # => 4
  
voter-data.row-n(3)["Party"] # => Labour

order-by(count(voter-data, "Party"), "count", false)

#reading one valuje with get-column

fun get-column(r :: Row, colname :: String):
  doc: "returns the value in row r for the column colname"
  r[colname]
where:
  get-column(voter-data.row-n(3), "Party") is "Labuor"
  get-column(voter-data.row-n(0), "VoterID") is "1"
end
filter-with(voter-data, lam(r): get-column(r,"Party") == "Labour" end).length()
get-column(voter-data.row-n(3), "Party")

with-year = build-column(voter-data, "BirthYear",
  lam(r): string-substring(get-column(r, "DOB"), 6, 10)end)

get-column(with-year.row-n(0), "BirthYear")


#fixing the typo
fun fix-labour(s :: String) -> String:
  doc: "corrects the one known misspelling of labour"
  if s == "Labuor" : "Labour"
  else if s == "" : "No Party"
  else:
    s
  end
where:
  fix-labour("Labour") is "Labour"
  #fix-labour("") is "None"
  fix-labour("Labuor") is "Labour"
end

fixed-typo = transform-column(voter-data,"Party", fix-labour)
fixed-typo
  
fixed-asc = order-by(count(fixed-typo, "Party"), "count", false)
fixed-asc
freq-bar-chart(fixed-typo, "Party")