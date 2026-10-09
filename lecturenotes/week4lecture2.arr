use context dcic2024
#|
   the two operations:
   1- transform-column:
   your function takes: one value
   you get back: same colums, new value in one
   
   2- build-colum:
   your function takes: one whole row
   you get back: one extra column
|#

sales = table: item :: String, price :: Number, qty :: Number
  row: "Tea", 2.50, 4
  row: "Coffee", 3.00, 2
  row: "Cake", 4.25, 3
end
#transform column
fun add-vat(p :: Number) -> Number:
  doc: "returns the rpice with 20 percent VAT added"
  p * 1.2
where:
  add-vat(10) is 12
  add-vat(0) is 0
end

with-vat = transform-column(sales, "price", lam(p): p * 1.2 end)
  #with-vat = transform-column(sales, "price", add-vat) # transform-column :: (t :: Table, colname :: String, function(where it is changed):: (A -> B)) -> Table

sales.get-column("price") #original prices in the column
with-vat.get-column("price") #outputs a single column that is specified in the parenthesis

#build-column
fun line-total(r :: Row) -> Number:
  doc: "returns price times quantity for one order line"
  r["price"] * r["qty"]
where:
  line-total(sales.row-n(0)) is 10
  line-total(sales.row-n(2)) is 12.75
end

with-total = build-column(sales, "total", line-total)
sales
with-total.get-column("total")


#chain them, adding both functions together
#adds VAT then total the VAT inclusive prices

billed = build-column(transform-column(sales, "price", add-vat), "total", line-total)

#transform-column(sales, "price", add-vat) adds vat to the price

#build-column(sales, "total", line-total) creates then new column for total





items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
  row: "Sword of Dawn",           23,  -87
  row: "Healing Potion",         -45,   12
  row: "Dragon Shield",           78,  -56
  row: "Magic Staff",             -9,   64
  row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  -66,    5
  row: "Ring of Fire",            38,  -92
  row: "Boots of Swiftness",     -17,   49
  row: "Amulet of Protection",    82,  -74
  row: "Orb of Wisdom",          -29,  -21
end

#solution exercise 1

fun pull-closer( t :: Table) -> Table:
  doc: "returns the table with every item moved ten percent nearer to the origin"
  transform-column(
    transform-column(items, "x-coordinate", lam(n): n * 0.9 end), "y-coordinate", lam(n): n * 0.9 end
    )
end




  
  