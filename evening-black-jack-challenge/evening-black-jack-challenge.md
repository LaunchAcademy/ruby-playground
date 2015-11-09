## Black Jack Unit Testing

When playing cards at the casino accuracy is of extreme importance.  One number
off could be the matter of thousands or millions of dollars lost.  For this exercise
we are going to write unit tests for the method that calculates the total of a
hand in blackjack.  Writing tests allow you to make sure the behavior you expect
to happen is actually happening.  They also give you direction in the design
process of your code.

The testing framework we will be using for this exercise is
[RSpec](http://rspec.info/).  RSpec is a DSL (Domain Specific Language) that
makes writing tests easier and more semantic.  It is heavily used in the Rails
community.

The RSpec [documentation](https://relishapp.com/rspec) is a great place to start learning what methods are
available to you when writing tests.  Look through `rspec-core` and
`rspec-expectations`.  Avoid the `rspec-mocks` and `rspec-rails` sections for
now.

There is already a `Deck` class set up with some tests.  Take a few minutes to
read through those tests to figure out what is going on.  Once you have a better
idea of whats happening see if you can start writing the tests for the
`#calculate_hand` method in the `Hand` class.
A score is calculated by adding up the values of the cards in a player's hand.
Face cards (Jack, Queen, King) are worth 10 points and Aces are worth either 1 point or 11 points (whichever value yields the best score).
Finally, implement the actual method in order to make the tests pass.

To run the tests you will type: `rspec spec` into your terminal.

_Note_: Make sure to run `bundle install` to get RSpec installed
