Taken from [Wikipedia][wikipedia]:

> Suppose you're on a game show, and you're given the choice of three doors: Behind one door is a car; behind the others, goats. You pick a door, say No. 1, and the host, who knows what's behind the doors, opens another door, say No. 3, which has a goat. He then says to you, "Do you want to pick door No. 2?" Is it to your advantage to switch your choice?

### Instructions

Write a program to simulate the game show and report how often each the user guesses correctly. The program should simulate two different scenarios: one where the user switches doors and another when the user doesn't. The simulation should be run **n** times where **n** is passed as a command-line argument (i.e. `ruby monty_hall.rb 100` should run the simulation 100 times). Print out the outcomes for both scenarios as a percentage of games guessed correctly.

### Sample Usage

```no-highlight
$ ruby monty_hall.rb 10

Percentage games guessed correctly:
With switching:     %60.0
Without switching:  %20.0

$ ruby monty_hall.rb 1000

Percentage games guessed correctly:
With switching:     %67.6
Without switching:  %33.0

$ ruby monty_hall.rb 1000000

Percentage games guessed correctly:
With switching:     %66.7
Without switching:  %33.3
```

[wikipedia]: http://en.wikipedia.org/wiki/Monty_Hall_problem
