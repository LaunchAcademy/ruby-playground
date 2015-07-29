# Enumerable

The [Enumerable mixin][enumerable] includes several methods that work with any class that defines the `each` method. These methods abstract common operations performed on collections such as converting from one type to another or filtering values on some condition.

## Instructions

Implement the `map`, `reduce`, `filter`, and `any?` methods. Rather than defining the methods on a particular class, assume they take in a collection that responds to the `each` method as an argument.

## Sample Usage

Here is an example of the `map` method being used to square an array of numbers:

```ruby
numbers = [3, 5, 2, 6]

map(numbers) { |x| x * x }
# => [9, 25, 4, 36]
```

[enumerable]: http://ruby-doc.org/core-2.1.2/Enumerable.html
