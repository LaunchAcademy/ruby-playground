## Contents

In this section we will continue to learn about how classes work in ruby. In
particular we will be focused on understanding instance methods and instance
variables.

## Learning Goals

* Learn how to define and call instance methods
* Practice using instance methods to create behavior

### Intro

In the previous unit, we studied Ruby classes and how to define them. We also
learned how to construct instances of a class with different characteristics by defining the
`.initialize` method and calling it with the `.new` method. 

We've discussed **state** in some detail, mainly pertaining to assigning instance
variables inside of the constructor. Let's expand on this concept, and learn how
to add **behavior** to our instances.

### Behavior With Instance Methods

In the very beginning of our work together, we talked about the grammar of
object oriented development. We've already worked with a number of classes
provided by Ruby core that provide **instance methods**.

Try the following in a pry session.

```ruby
"ALL CAPS".downcase
```

Here, from a grammar perspective, we're calling the verb `downcase` on the proper noun `"ALL CAPS"`. 
Put in terms of object oriented programming, we're calling the **instance method**
`downcase` on the string instance `"ALL CAPS"`.

We can introduce our own instance methods when defining our classes. Let's
extend the `Person` class to include some new behavior.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there!"
  end
end
```

Let's put this newly modified class to work in a pry session.

```no-highlight
pry(main)> john = Person.new('John')
=> #<Person:0x007fce4a33a408 @name="John">
pry(main)> john.greet
Hi there!
```

To break down what's happened above:

1. We construct a new instance
2. We invoke the instance method `greet` on the instance `john`
3. The `greet` method does the work of outputing `Hi there!`

We define instance methods to the way in which we have previously defined our methods, 
but with one key difference. We place the method definition **inside** of a class
definition. This indicates that we want the method to be available and callable 
for all instances of that class.

We can add behavior to our class by defining additional instance methods. When
designing our objects, we should always define behavior that makes sense for the
class itself. For example, we've added a `part_ways` method making our `Person`
class responsible for both greeting and saying goodbye to a given person.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there!"
  end

  def part_ways
    puts "Bye now!"
  end
end
```

Classes provide us with a way to keep our programs organized, neat, and tidy.
For example, we would not define a `bark` behavior for a instances of the class
`Person`, because people do not *normally* bark. It would violate the metaphor
that we're trying to achieve in our program. Instead, we would define a new
class, `Dog`, that would exhibit that behavior.

As a quick challenge, define a `Dog` class that implements a `bark` instance
method. It should take the dog's name as an argument to the constructor.

{% show_solution %}
```ruby
class Dog
  def initialize(name)
    @name = name
  end

  def bark
    puts "WOOF"
  end
end
```
{% endshow_solution %}

While we've introduced behavior to our instances, the behavior isn't very
interesting. While we are storing the names of our `Dog` and `Person` instances
by storing them in an instance variable, we're not doing anything meaningful 
with that data. To make our class definitions more functional, 
let's incorporate an instance's state or characteristics as part of 
its behavior.

### Using State in Our Behavior

To make our `greet` method better, let's incorporate the `@name` state of the
instance.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there, #{@name}!"
  end

  def part_ways
    puts "Bye now!"
  end
end
```

If we open up a pry session, we can see how the new `greet` implementation makes
use of the instance's state.

```no-highlight
pry(main)> john = Person.new('John')
=> #<Person:0x007fce4a86c6d8 @name="John">
pry(main)> john.greet
Hi there, John!
=> nil
```

Similarly, we can modify the `part_ways` instance method to incoporate the
person's name.

```ruby
class Person
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hi there, #{@name}!"
  end

  def part_ways
    puts "Bye now, #{@name}!"
  end
end
```

For the first time, we can see how instance variables and class-based design help 
us to keep things DRY. 
Whether we're saying hello or goodbye to the person, the person's name is
relevant in both behaviors. Using an instance variable allows us to share that
information among all instance methods.

Consider an alternative, method based implementation.

```ruby
def greet(name)
  puts "Hi there, #{name}"
end

def part_ways(name)
 puts "Bye now, #{name}"
end
```

In the example above, we have to pass the name in as an argument to both
methods. As we add more functionality around interacting with a specific person
through the definition of more methods,
we will constantly have to pass name information in as an argument to our pure
method implementation. Classes give us more flexibility, and they help us to
make more coherent, human friendly designs for our program.


