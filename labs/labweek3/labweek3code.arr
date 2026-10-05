use context dcic2024
include csv
include data-source



fun leap-year(year :: Number) ->  Boolean:
  doc: "checks whether an inputted year is a leap year"
  if num-modulo(year,400) == 0:
    true
    else if
    num-modulo(year,100) == 0:
    false
    else if
    num-modulo(year, 4) == 0:
    true
    else:
    false
  end
  
where:
 leap-year(2024) is true
  leap-year(2028) is true
  leap-year(2003) is false
  leap-year(1900) is false
  leap-year(2000) is true
end
 


fun tick(sec :: Number) -> Number:
  doc: "makes the second value tick forward one second, resetting to 0 at 59"
  if sec == 59:
    0
  else:
    sec + 1
  end
    
  
  
  
where:
  tick(0) is 1
  tick(20) is 21
  tick(59) is 0
end



fun rock-paper-scissors(p1 :: String ,p2 :: String) -> String:
   doc: "determines the winner of a rock paper scissors game"
  #check for valid inputs
   p1-valid = (p1 == "rock") or (p1 == "paper") or (p1 == "scissors")
  p2-valid = (p2 == "rock") or (p2 == "paper") or (p2 == "scissors")
  
  ask:
    |not(p1-valid) or not(p2-valid) then: "invalid choice"
    | p1 == p2 then: "tie"
    |(p1 == "rock") and (p2 == "scissors") then: "player 1"
    |(p1 == "paper") and (p2 == "rock") then: "player 1"
    |(p1 == "scissors") and (p2 == "paper") then: "player 1"
    |otherwise:
     "player 2"
  end
  
  
  
 where:
  rock-paper-scissors("rock", "rock") is "tie"
  rock-paper-scissors("paper", "paper") is "tie"
  rock-paper-scissors("scissors", "scissors") is "tie"
  rock-paper-scissors("rock", "scissors") is "player 1"
  rock-paper-scissors("paper", "rock") is "player 1"
  rock-paper-scissors("scissors", "paper") is "player 1"
  rock-paper-scissors("scissors", "rock") is "player 2"
  rock-paper-scissors("rock", "paper") is "player 2"
  rock-paper-scissors("paper", "scissors") is "player 2"
  rock-paper-scissors("lizard", "rock") is "invalid choice"
  rock-paper-scissors("paper", "spock") is "invalid choice"
  rock-paper-scissors("ROCK", "paper") is "invalid choice"
end


planets = table: planet :: String, distance :: Number
  row: "Mercury",	0.39
  row: "Venus",	0.72
  row: "Earth",	1
  row: "Mars",	1.52
  row: "Jupiter",	5.2
  row: "Saturn",	9.54
  row: "Uranus",	19.2
  row: "Neptune",	30.06
end

mars = planets.row-n(3)
mars

mars["distance"]



something = load-table:
  year :: Number, day :: Number, month :: String, rate :: Number
  source: csv-table-file("boe_rates.csv", default-options)
  sanitize year using num-sanitizer
  sanitize day using num-sanitizer
  sanitize rate using num-sanitizer
end
something.length()
median(something, "rate")
modes(something, "rate")


asc = order-by(something, "rate", true)

des = order-by(something, "rate", false)


# Minimum rate (first row of ascending table)
min-rate = get-column(get-row(asc 0), "rate")

# Maximum rate (first row of descending table)
max-rate = get-column(get-row(des, 0), "rate")


