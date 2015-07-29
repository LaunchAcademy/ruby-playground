### Instructions

Write a ruby program which determines if there is a winning combination of `x` or `o` on a tic tac toe board.

### Sample Usage

```ruby
game = [['o', ' ', ' '],
        ['o', ' ', ' '],
        ['o', ' ', ' ']]

winner?(game) #=> true

game = [['o', ' ', 'x'],
        ['x', 'x', 'o'],
        ['o', ' ', 'x']]

winner?(game) #=> false
```
