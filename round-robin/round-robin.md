# Round-Robin Tournament Scheduler

According to [Wikipedia](http://en.wikipedia.org/wiki/Round-robin_tournament#Scheduling_algorithm), "A round-robin tournament (or all-play-all tournament) is a competition "in which each contestant meets all other contestants in turn."

## Instructions

Write a method that schedules a round-robin tournament given an array of names. The output should be returned as a nested array.

If there are an odd number of teams, the tournament should include "bye" weeks where one team does not play. Each team should receive one bye week in the schedule.

## Sample Usage

```ruby
# With an even number of names.
schedule_tournament(['Venkman', 'Ray', 'Egon', 'Winston'])
# => [[["Venkman", "Egon"], ["Ray", "Winston"]],
#     [["Venkman", "Ray"], ["Winston", "Egon"]],
#     [["Venkman", "Winston"], ["Egon", "Ray"]]]

# With an odd number of names.
schedule_tournament(['Larry', 'Moe', 'Curly'])
# => [[["Larry", "Curly"], ["Moe"]],
#     [["Larry", "Moe"], ["Curly"]],
#     [["Larry"], ["Curly", "Moe"]]]
```
