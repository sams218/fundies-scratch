use context dcic2024
include csv
include data-source

flights = load-table: 
  rownames :: String,
  dep_time :: String,
  sched_dep_time :: Number,
  dep_delay :: Number,
  arr_time :: String,
  sched_arr_time :: String,
  arr_delay :: String,
  carrier :: String,
  flight :: Number,
  tailnum :: String,
  origin :: String,
  dest :: String,
  air_time :: Number,
  distance :: Number,
  hour :: Number,
  minute :: Number,
  time_hour :: String
  source: csv-table-file("flights.csv", default-options)
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
end

fun is_long_flight(r :: Row) -> Boolean:
  doc: "checks the distance column for flights longer than 1500"
  r["distance"] >= 1500
end

long-flights = filter-with(flights, is_long_flight)

long-flights-asc = order-by(long-flights, "air_time", false)

top-flight = long-flights-asc.row-n(0)
top-carrier = top-flight["carrier"]
top-origin = top-flight["origin"]
top-dest = top-flight["dest"]



#no. 2

fun is-delayed-departure(r :: Row) -> Boolean:
  doc: "checks whether a flight was delayed for at least 30 mins"
  r["dep_delay"] >= 30
end

fun is-morning-sched-dep(r :: Row) -> Boolean:
  doc: "checks whether a flights scheduled departure time was before noon"
  r["sched_dep_time"] < 1200
end

delayed = filter-with(flights, lam(r): r["dep_delay"] >= 30 end)

delayed-morning = filter-with(flights, lam(r): r["sched_dep_time"] < 1200 end)

delayed-morning-far = filter-with(flights, lam(r): r["distance"] > 500 end)

delays-dec = order-by(flights, "dep_delay" , false)

worst-flight = delays-dec.row-n(0)
worst-flight-num = worst-flight["flight"]
worst-flight-origin = worst-flight["origin"]
worst-flight-delay = worst-flight["dep_delay"]