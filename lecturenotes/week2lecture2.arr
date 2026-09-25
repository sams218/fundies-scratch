use context starter2024

# fun welcome(name,name1,name2):
#   ("Welcome to the class, " + name) + ", " + name1 + " and " + name2
# end

# x = "Isabella"
# y = "Rei"
# z = "Adi"






# armenia = frame(
#   above(rectangle(120, 30, "solid", "red"),
#     above(rectangle(120, 30, "solid", "blue"),
#       rectangle(120, 30, "solid", "orange"))))

# austria = frame(
#   above(rectangle(120, 30, "solid", "red"),
#     above(rectangle(120, 30, "solid", "white"),
#       rectangle(120, 30, "solid", "red"))))

# fun three-stripe-flag(top,mid,bot):
#   frame(
#     above(rectangle(120,30,"solid",top),
      
#       above(rectangle(120,30,"solid",mid),
      
#         rectangle(120,30,"solid",bot))))
# end



# fun area(width :: Number, height :: Number):
#   doc: "calculates the area of a quadrilateral"
#   width * height
# end

price = 5.00
numshirts = 4
# total-cost = (numshirts * price) + (string-length("Go Team!") * 0.10)

fun total-cost(num-tshirts :: Number,shirt-string :: String):
  doc:"calculates the price of tshirts per character added"
  (numshirts * price) + (string-length(shirt-string) * 0.10)
end


fun celsius-to-fahrenheit(cel :: Number) -> Number:
  doc:"calculates the conversion of celsius to fahrenheit"
  (cel * (9/5)) + 32
end
