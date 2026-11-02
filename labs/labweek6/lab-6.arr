use context dcic2024
#Sam Stapkowski


#Expressions
3 * 3.20 #=> 9.6
"Oat" + " " + "latte" # => Oat latte
string-length("cappuccino") #=> 10



#Definitions and Functions
latte-price :: Number = 3.20

fun order-cost(num :: Number, price :: Number) -> Number:
  doc: "takes the number of drinks and the price of each drink and returns the cost of the order"
  num * price
where:
order-cost(0,5) is 0
order-cost(5,0) is 0
order-cost(2,4) is 8
order-cost(2, latte-price) is 6.4
end




#Conditionals and tests
fun discount-rate(drink-num :: Number) -> Number:
  doc: "outputs the discount rate based on the amount of drinks ordered"
  if drink-num <= 5:
    0
  else if drink-num <= 9:
    0.1
  else:
    0.2
  end
where:
  discount-rate(4) is 0
  discount-rate(5) is 0
  discount-rate(9) is 0.1
  discount-rate(10) is 0.2
end
  


#Tables
orders = table: customer, drinks, price
  row: "Amira", 2, 3.20
  row: "Ben", 6, 2.80
  row: "Chen", 12, 3.00
  row: "Dara", 1, 3.50
end

with-cost = build-column(orders, "cost", lam(r): r["drinks"] * r["price"] end)

five-plus-drinks = filter-with(with-cost, lam(r): r["drinks"] > 5 end)


#Lists, loop, and fold

drinks-list = orders.get-column("drinks")


fun total-drinks-loop(lst :: List<Number>) -> Number: 
  doc: "adds the drinks up to create a total number of drinks"
  block:
  var total = 0
    for each(d from lst):
    total := total + d
  end
  total
end
where:
  total-drinks-loop(drinks-list) is 21
end



#Structured data and recursion
data Order:
  | eat-in(drinks :: Number)
  | takeaway(drinks :: Number, own-cup :: Boolean)
end
fun cup-fee(o :: Order) -> Number:
  doc: "Calculates the cup fee based on order type and whether they brought their own cup"
  cases (Order) o:
  |eat-in(drinks) => 0
  |takeaway(drinks, own-cup) =>
      if own-cup:
        0
      else:
        drinks * 0.25
      end
  end
where:
cup-fee(eat-in(2)) is 0
cup-fee(takeaway(2)) is 0.5
end


fun total-drinks-rec(lst :: List<Number>) -> Number:
  
  
  



