use context dcic2024
include csv
include data-source
flights_53 = load-table:
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
  source: csv-table-file("flights_sample53.csv", default-options)
  sanitize flight using num-sanitizer
  sanitize air_time using num-sanitizer
  sanitize hour using num-sanitizer
  sanitize minute using num-sanitizer
  sanitize distance using num-sanitizer
  sanitize dep_delay using num-sanitizer
  sanitize sched_dep_time using num-sanitizer
  sanitize arr_delay using num-sanitizer
end

fun no-tail-num(num :: String) -> String:
  doc: "changes blank tail numbers to unknown"
  if num == "" : "UNKNOWN"
  else:
    num
  end
end
  
  
#uses transform column to apply the function to the tailnum column
fixed-tailnum = transform-column(flights_53, "tailnum", no-tail-num)
fixed-tailnum


fun delay-clean(n :: Number) -> Number:
  doc: "changes negative  delays to 0"
  if n < 0:
    0
  else:
    n
  end
end



transform-column(flights_53, "arr_delay", delay-clean)

transform-column(flights_53, "dep_delay", delay-clean)


