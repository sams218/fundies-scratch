use context starter2024
#T-Shirt Shop 5 designs
(12 * 5) + 3 
#|
   = 63 pounds. multiplies the cost per shirt by the amount of shirts. Then adds
   the 3 pound design fee.
|#

#T-Shirt shop 7 designs
(12 * 7) + 3
#does same thing but now with 7 shirts rather than 5.

#rectangular poster
perimeter = 2 * (420 + 594)
perimeter * 0.10
#without the parenthesis we are given an error because the operators are not separated





#String Suprises
"Designs for everyone!"

#color library
"red" 
"blue" 
"gold"
"red" + "blue"
#when added together, they combine without a space.

# 1 + "blue" yields an error because an integer type cannot be added to a string type. If the integer is turned into a string, then this can be done.





#traffic light
#here is the rectangle, then the circles for the lights
rect = rectangle(40,100,"solid","black")
redcirc = circle(10,"solid","red")
yellowcirc = circle(10,"solid","yellow")
greencirc = circle(10,"solid","green")
#this puts the circles on the rectangle at the same time using the overlay xy function.
light =
  overlay-xy(redcirc, -10, -5,
    overlay-xy(yellowcirc, -10,-35,
      overlay-xy(greencirc, -10, -65, rect)))
light





#broken code hunt
# Goal: A rectangle with width 50 and height 20, solid black
rectangle(50, 20, "solid", "black")
#"solid" is in the wrong spot so the function does not recognize it. needs to move over one.

circle(30, "solid", "red")
#the string "solid" was not in quotation marks.







#Flag
flagrect = rectangle(400,200,"solid","red")
symbol = triangle(40,"solid","black")
vertstripe = rectangle(20,200, "solid","black")
horizstripe = rectangle(400,20,"solid","black")
#my different shapes written as variables
flag = 
  overlay-xy(symbol,-10,-5,
    overlay-xy(vertstripe,-300,0,
      overlay-xy(horizstripe,-0,-100,flagrect)))
flag
#my shapes overlayed on the rectagle to make the flag