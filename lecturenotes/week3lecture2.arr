use context dcic2024
include csv
include data-source

  workouts = table: date :: String, activity :: String, duration :: Number
  row: "2026-04-01", "Running", 30
  row: "2026-04-02", "Swimming", 20
  row: "2026-04-03", "Cycling", 60
  end

first-row = workouts.row-n(0)
first-row

first-row['activity']
workouts.row-n(0)['duration']

#to get number of rows in workouts
workouts.length()

#to get all values in a specific column
workouts.get-column("activity")


#some basic stats
mean(workouts, "duration")
median(workouts, "duration")
sum(workouts, "duration")
stdev(workouts, "duration")
modes(workouts, "activity")


#import the csv from a file
recipes = load-table:
  title :: String, servings :: Number, prep-time :: Number
  source: csv-table-file("dataset/recipes.csv", default-options)
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end

recipes.length()

mean(recipes, "prep-time")

hist-plot = histogram(recipes, "prep-time", 50)

box = box-plot(recipes, 'servings')


    