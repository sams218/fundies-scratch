use context starter2024
include image

rect-width = 120
rect1-color = "red"
rect2-color = "green"

rect-length = 40

flag-before = above(rectangle(rect-width, rect-length, "solid", rect1-color),
  rectangle(rect-width,rect-length,"solid",rect2-color))

flag-before

triangle-length = 35
triangle-color = "orange"

orange-triangle = triangle(triangle-length,"solid",triangle-color)

orange-triangle


side-length = 50
square-color = "purple"

named-square = square(side-length,"solid",square-color)


plain-square = square(50,"solid","purple")



check "same image, different code":
  named-square is plain-square
end

area = 3 * 5
check "area is 15":
  area is 15
end


circle-size = 25
circle-color = "yellow"
blk-length = 125
blk-width = 100
blk = "black"

badge-some = overlay(circle(circle-size,"solid",circle-color),(rectangle(blk-width,blk-length,"solid",blk)))
badge-some




