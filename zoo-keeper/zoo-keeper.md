# Zoo Keeper

## Instructions

*Earn Hash Methods!*

In this kata you'll implement a series of methods that iterate over
a hash of animals for a zookeeper.  Each method should return a new hash
that meets certain criteria.  Being that you're a new developer
the zookeeper does not trust you with any of the advanced hash methods.  You
can only use `each`, no `select, reject, map, reduce, invert` or any
other hash methods you find
[here](http://www.ruby-doc.org/core-2.1.0/Hash.html).

Run the test and add your solutions to `lib/zoo_keeper.rb`.

## Example for `each`

Calling `each` on a hash will take each pair of key and value and pass it
inside a block.  It allows you to loop over all keys and values in a
hash, deciding each time what you want to do with the data.

INPUT:

```ruby
shapes = {'triangle' => 3, 'square' => 4}

shapes.each do |key, value|
  puts "a #{key} has #{value} sides."
end
```

OUTPUT:

```ruby
"a triangle has 3 sides."
"a square has 4 sides."
```
