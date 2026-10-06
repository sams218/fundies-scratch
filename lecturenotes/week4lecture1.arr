use context dcic2024
include csv

orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00 #index 2
  row: "11:00", 3.95 #index 3
  row: "14:00", 4.95 #index 4
  row: "16:45", 7.95
end

fun is-high-value(o :: Row) -> Boolean:
  o["amount"] >= 8.0
where:
  is-high-value(orders.row-n(2)) is true
    is-high-value(orders.row-n(4)) is false
end



fun compute-sum(f-num :: Number, s-num :: Number) -> Number:
doc: "takes two numbers and computes the sum"
f-num + s-num
where:
compute-sum(2,3) is 5
compute-sum(9,9) is 18
compute-sum(6,7) is 13
end


new-high-orders = filter-with(orders, is-high-value)

high-value-orders =  table: time, amount
  row: "08:00", 10.50
  row: "10:15", 8.00
end

check:
  new-high-orders is high-value-orders
end
  
filter-with(orders, lam(o): o["amount"] >= 8.0 end)

#order-by
x = order-by(orders, "amount", true) #true is ascending order
order-by(orders, "amount", false) #false is descending order


fun is-morning(r):
  r["time"] < "12:00"
  end

# morning-orders = filter-with(orders,is-morning)


# morning-orders = filter-with(orders, lam(r): r["time"] < "12:00" end)
  
  
  
  morning-orders = filter-with(orders, lam(r): r["time"] < "12:00" end)

sorted-orders = order-by(orders, "time", false)

latest-morning-amt = sorted-orders.row-n(0)["amount"]
latest-morning-amt



photos = load-table: location :: String, subject :: String, date :: String
  source: csv-table-url("https://raw.githubusercontent.com/NU-London/LCSCI4207-datasets/refs/heads/main/photos.csv", default-options)
end
filter-with(photos, lam(r): r["subject"] == "Forest" end)