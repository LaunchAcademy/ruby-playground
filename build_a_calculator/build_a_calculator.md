Let's put what we've learned together and then some by building a basic calculator! It's always important to think about requirements when approaching a problem. Let's list out our requirements here for the calculator:

```
A calculator can accomplish four tasks, or 'operations':
(1) Addition: A sum is produced when two numbers are added together
(2) Subtraction: A difference is produced when we subtract two numbers
(3) Multiplication: A product is produced when two numbers are multiplied
(4) Division: A quotient is produced when we divide two numbers
```

* A user should be able to choose what kind of operation to do on two numbers number1 and number2
* The output of the calculator will be based on two user inputs number1 and number2 and the user operation selection:
  * addition: `number1 + number2`
  * subtraction: `number1 - number2`
  * multiplication: `number1 * number2`
  * division: `number1 / number2`

Now that we have our requirements, let's get started. Before putting any code down, let's try *pseudocoding* the problem. What *pseudocoding* lets us do is, without worrying about syntax, write out how the program might work in English. Later on, you may pseudocode less, but for now, it's a great way to break down problems step by step. Breaking down problems into their smallest parts is absolutely necessary as a programmer. Let's label out these steps here:

First we need to ask the user what kind of operation they want to do. Like in section 1, we will get user input for each step of our program:
```
(1) We ask the user what operation they want to compute: Addition, Subtraction, Multiplication and Division
```

Then we need to capture their response somehow:
```
(2) We store that response into a variable called `operation`
```

Next we need to capture the two numbers they want to operate on:
```
(3) We then ask the user what two numbers they want to compute on, storing those numbers into variables `number1` and `number2`
```

Finally, we will return the value of the operation on the user's inputs:
```
(4) Based on the variable `operation`, we return an output of that operation on `number1` and `number2`
```

Stop a moment and think about each step and why we are breaking out the steps the way we did. We can probably break them out further, but do we need to? For example, maybe step (3) needs to be two steps (one for each number), but we can figure that out later. For now, we have a good place to start our calculator!

Let's look at step (1) again:

```
(1) We ask the user what operation they want to compute: Addition, Subtraction, Multiplication and Division
```

A while back, we talked about the method `gets.chomp` which will grab user input which we can store in a variable:

```ruby
puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
operation = gets.chomp
```
Here is a [link](link) to the `gets.chomp` article, as a reminder.

This prompts the user to enter in an operation and then stores the user's input in the `operation` variable as a string. Throw that bit of code in IRB and see the output:

```
irb(main):001:0> puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division.
=> nil
irb(main):002:0> operation = gets.chomp
a
=> "a"
irb(main):003:0> operation
=> "a"
```

The user entered in `a` and now the variable `operation` points to the string `a`. Something similar would happen for any other letter that was entered. What happens if a user enters something other than `a`, `s`, `m`, or `d`? More than occasionally, as programmers, we will come across issues like these. It's worth introducing a concept here called *rubber ducking*.

[![alt](https://s3.amazonaws.com/horizon-production/images/release-the-quackin-meme.jpg)]
(http://en.wikipedia.org/wiki/Rubber_Duck_%28sculpture%29)

Being stuck is part of being a programmer. How do we deal with being stuck? [Rubber duck debugging](http://en.wikipedia.org/wiki/Rubber_duck_debugging), or just 'Rubber ducking,' is the process of speaking to an inanimate object (the rubber duck) about a programming problem in order to come across a solution to the problem. Our brain works in mysterious ways. Often, when we suffer through a problem we magically come across a solution after getting away from it for a little while. In the same way, when we work through a programming problem, we might come across a stumbling block. Explaining this stumbling block to something -- like a rubber duck -- can help us clarify ourselves. Perhaps our code is intended to do one thing but it appears to do another. Explaining this discrepancy out loud can help us arrive at a solution. Let's see how a rubber ducking conversation might go about our question:

```
You: I don't know what's going to happen if a user enters something other than an 'a', 's', 'm' or 'd.'
Duck: . . .
You: I mean, if it isn't one of those four, something should happen, right?
Duck: . . .
You: Ok, Ok, I guess I should probably say something to the user then?
Duck: . . .
You: Well, in that case, I'm going to need some flow control!
Duck: . . .
You: I can check if the user has entered one of those four and if they haven't, I stop the program!
Duck: <smile>
```

Having a short conversation with an inanimate object got us from being stuck and wondering what we do with bad user input to getting to a specific plan of attack -- flow control! Let's update our program for this. We need to check if the user has entered something other than `a`, `s`, `m`, or `d`. We can use an `if-else` here to do that:

```ruby
puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
operation = gets.chomp

if operation == "a" || operation == "s" || operation == "m" || operation == "d"
  puts "Placeholder for calculation"
else
  puts "Sorry, you entered an invalid operation"
end
```

What this code does now is check if the input is either `a`, `s`, `m`, or `d` and prompts the user if it's not one of those. We left a placeholder in for the good inputs which we'll fill out now. Wait, how are we going to proceed? Let's ask the rubber duck!:

```
You: Ok, so we added the check for making sure the user input was good. What do we do next?
Duck: . . .
You: Well, I guess we need to get the user input, right? Let's look back at our pseudocode.
Duck: . . .
You: Yeah, that's it! According to step (3), we need to get the two numbers that the user wants to operate on! We'll need to use gets.chomp again for this, twice!
Duck: <smile>
```

Great, so let's put that into action.

```ruby
puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
operation = gets.chomp

if operation == "a" || operation == "s" || operation == "m" || operation == "d"
  puts "Please enter Number 1"
  number1 = gets.chomp
  puts "Please enter Number 2"
  number2 = gets.chomp
else
  puts "Sorry, you entered an invalid operation"
end
```

Now that we are prompting the user for inputs and storing those into variabes `number1` and `number2`, we can do calculations on those numbers. We will have to nest some `if`s within the parent `if`. Let's start with multiplication just to make sure we're on the right path:

```ruby
puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
operation = gets.chomp

if operation == "a" || operation == "s" || operation == "m" || operation == "d"
  puts "Please enter Number 1"
  number1 = gets.chomp
  puts "Please enter Number 2"
  number2 = gets.chomp
  if operation == "m"
    product = number1 + number2
    puts "The product is #{product}"
  end
else
  puts "Sorry, you entered an invalid operation"
end
```

Seems good, right? By the way, remember how we talked about *string interpolation* in the **variables** section? That's what our `#{product}` code snippet is doing here. Take a look back at that section for a reminder.

Let's try running our program!:

```
Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division.
m
Please enter Number 1
12
Please enter Number 2
9
calculator.rb:10:in `*': no implicit conversion of String into Integer (TypeError)
  from calculator.rb:10:in `<main>'
```

Oh no! We expected the product of 12 and 9 (which is 108), but we're receiving some kind of error. What are we going to do? It's time to debug. We have entered the world of the stack trace and the syntax error.

![alt](https://s3.amazonaws.com/horizon-production/images/Windows_9X_BSOD.png)

##### Stack traces and syntax errors

As a programmer, you'll have to debug code every day. What is debugging? Debugging is basically the process of finding and removing errors in a program. Luckily, Ruby lets you know where an error might be coming from. The *stack trace* is something we'll come across often when it comes to errors and debugging. A stack trace will indicate where a program failed and the code that was executed until that failure.

As Rubyists, we have tools to help us debug. One of the best such tools is known as `pry`. We have a great screencast on `pry` available for you with some excellent details on how to get `pry` setup and running. Make sure to watch that before continuing here. Here is a [link](link) to the screencast for quick reference.

Now that we have `pry` in our toolbelt, let's look back at the error that was prompted to determine where to place our `binding.pry`. `binding.pry` is basically a stopping point where you can look around your program and see what values your variables are. Look at our error again:

```
calculator.rb:10:in `*': no implicit conversion of String into Integer (TypeError)
  from calculator.rb:10:in `<main>'
```

This tells us that we have a `TypeError` on line 10 of our calculator program. This means that something on line 10 is failing. Where would we want to put our stopping point, or `binding.pry`? Let's ask the rubber duck:

```
You: Ok, there is a TypeError, whatever that means on line 10. What should I do?
Duck: . . .
You: Well, yeah, I guess I should look at line 10. It says 'product = number1 * number2', which means there has to be some error there. It looks fine to me.
Duck: . . .
You: Ok, I guess we should look at our variables right before line 10. So let's put that binding.pry on the prior line!
Duck: <smile>
```

Now that we've placed a `binding.pry` right before the problematic line, we can run our program again. Note that our line numbers have changed a bit since we included `pry`:

```ruby
From: /Users/vikram7/Dropbox/launchacademy/calculator.rb @ line 12 :

     7:   puts "Please enter Number 1"
     8:   number1 = gets.chomp
     9:   puts "Please enter Number 2"
    10:   number2 = gets.chomp
    11:   if operation == "m"
 => 12:     binding.pry
    13:     product = number1 * number2
    14:     puts "The product is #{product}"
    15:   end
    16: else
    17:   puts "Sorry, you entered an invalid operation"
```

The arrow points to the stopping point. We can now look at our variables `number1` and `number2`.

```ruby
[1] pry(main)> number1
=> "12"
[2] pry(main)> number2
=> "9"
```

Wait a minute. That looks funny. `number1` and `number2` are supposed to be numbers, or more precisely, integers, but they are strings. What happens when we try to multiply two strings together?:

```ruby
[3] pry(main)> "12"*"9"
TypeError: no implicit conversion of String into Integer
from (pry):3:in `*'
```

Ah ha! Now we're onto something. It looks like when we get the input from the user, `number1` and `number2` are being stored as strings rather than integers. But we learned earlier that we can cast strings to integers using the `.to_i` method. Let's apply that to `number1` and `number2`!:

```ruby
puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
operation = gets.chomp

if operation == "a" || operation == "s" || operation == "m" || operation == "d"
  puts "Please enter Number 1"
  number1 = gets.chomp.to_i
  puts "Please enter Number 2"
  number2 = gets.chomp.to_i
  if operation == "m"
    product = number1 * number2
    puts product
  end
else
  puts "Sorry, you entered an invalid operation"
end
```

Here, we are just casting our inputs as integers. Let's try running the program again:

```
Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division.
m
Please enter Number 1
12
Please enter Number 2
9
The product is 108
```

Perfect! Now that we are able to handle numbers rather than strings, we can continue with the rest of our program:

```ruby
1: puts "Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division."
2: operation = gets.chomp
3:
4: if operation == "a" || operation == "s" || operation == "m" || operation == "d"
5:   puts "Please enter Number 1"
6:   number1 = gets.chomp.to_i
7:  puts "Please enter Number 2"
8:  number2 = gets.chomp.to_i
9:  if operation == "m"
10:    product = number1 * number2
11:    puts "The product is #{product}"
12:  elsif operation == "a"
13:    sum = number1 + number2
14:    puts "The sum is #{sum}"
15:  elsif operation == "s"
16:    difference = number1 - number2
17:    puts "The difference is #{difference}"
18:  elsif operation == "d"
19:    quotient = (number1 / number2.to_f
20:    puts "The quotient is #{quotient}"
21:  end
22:else
23:  puts "Sorry, you entered an invalid operation"
24:end

```

Looks good, right? Ok, let's run it.

```
calculator.rb:21: syntax error, unexpected keyword_end, expecting ')'
calculator.rb:24: syntax error, unexpected keyword_end, expecting ')'
```

Oh no, we got another error! But this time, it's something called a `syntax error`. Syntax errors are errors that are mistakes in the syntax of the language of a program. They typically refer to missing parantheses, missing periods or semicolons or a missing `end` for flow control. It would be similar to missing punctuation in an English sentence. The Ruby interpreter is just not as forgiving as most people!

So back to our program. It looks like our paranthesis isn't closed when we're calculating our quotient on line 19! Let's close it (so it looks like `quotient = (number1 / number2.to_f)` and try running the program again (by the way, if you're wondering why we append a `.to_f` to `number2`, it's because we want to return a float instead of an integer in case we don't have a zero remainder when dividing `number1` and `number2`):

```
Please enter in an operation: (a) for addition; (s) for subtraction; (m) for multiplication; and (d) for division.
d
Please enter Number 1
6
Please enter Number 2
2
The quotient is 3.0
```

Great! Whew, we've done a lot of things here. We've combined what we've learned about variables, boolean logic, flow control and conditionals along with debugging our code. You'll be thinking like this a lot more in the future!
