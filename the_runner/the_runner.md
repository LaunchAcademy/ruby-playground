In preparation to train for The Boston Marathon, you read a marathon training
book that has a schedule of how many miles need to be run each week leading up
to the race.  Here is what the training plan looks like:

```no-highlight
###############
Training Plan:
###############

week 1 - 15
week 2 - 28
week 3 - 46
week 4 - 65
week 5 - 86
week 6 - 104
week 7 - 128
week 8 - 153
week 9 - 177
week 10 - 206
week 11 - 238
week 12 - 267
week 13 - 303
week 14 - 336
week 15 - 376
week 16 - 405
week 17 - 426
week 18 - 435
```

Here is what your actual training schedule ended up being:

```no-highlight
###############
Actual Schedule:
###############

week 1 - 20
week 2 - 24
week 3 - 46
week 4 - 67
week 5 - 86
week 6 - 104
week 7 - 130
week 8 - 149
week 9 - 180
week 10 - 205
week 11 - 240
week 12 - 267
week 13 - 303
week 14 - 337
week 15 - 380
week 16 - 405
week 17 - 424
week 18 - 435
```

Create a program that shows you how on track you were with the training plan.
The program should display each week with how many miles above or below the
training plan you were.  If you were on track then it should say: 'On track'.

Example Ouput:

week 1 - 5 miles above
week 2 - 4 miles below
week 3 - On track
...etc...

{% show_hint %}

- don't just hardcode in how many miles ahead/behind you are figure out how to do it dynamically
- look into hashes for storing key - value pairs
- try using the #each method for iterating over the hash.

{% show_solution %}

```ruby
training = { week_1: 15, week_2: 28, week_3: 46,
             week_4: 65, week_5: 86, week_6: 104,
             week_7: 128, week_8: 153, week_9: 177,
             week_10: 206, week_11: 238, week_12: 267,
             week_13: 303, week_14: 336, week_15: 376,
             week_16: 405, week_17: 426, week_18: 435 }

actual = { week_1: 20, week_2: 24, week_3: 46,
           week_4: 67, week_5: 86, week_6: 104,
           week_7: 130, week_8: 149, week_9: 180,
           week_10: 205, week_11: 240, week_12: 267,
           week_13: 303, week_14: 337, week_15: 380,
           week_16: 405, week_17: 424, week_18: 435 }
```

{% endshow_solution %}

{% endshow_hint %}
