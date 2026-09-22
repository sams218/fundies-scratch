use context starter2024

a = "Hello World!"
b = a + ' '

string-length(b)
string-repeat(b,3)

"CS" + "2000"

string-to-upper("hello cs2000!")
string-toupper("hello cs2000!")

string-to-lower("WELCOME TO CS2000")

string-substring("Welcome to London", 0, 7)

sample_string = "Hello, how are you? My name is Sam, and I am from the USA"

string-contains(sample_string, "Sam")
string-contains(sample_string, "Jeff")

sample2 = ("Football")
sample2lower = string-to-lower(sample2)
string-contains(sample2lower, "soccer")
string-contains(sample2lower, "football")

circle(30, "solid", "green")

rectangle(40,20,"solid","green")

triangle(50,"outline","red")

#composition, each of these takes two images and gives back one image

overlay(circle(30,"solid","blue"),rectangle(80,60,"solid","yellow"))
#overlay((first image),(second image))

#above((first image),(second image))
#below((first image),(second image))
#beside((first image),(second image))

above(rectangle(60,50,"solid","red"), triangle(60, "solid", "pink"))
below(rectangle(60,50,"solid","red"), triangle(60, "solid", "pink"))
beside(rectangle(60,50,"solid","red"), triangle(60, "solid", "pink"))