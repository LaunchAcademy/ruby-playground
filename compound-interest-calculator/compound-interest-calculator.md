### Instructions

Write a program which calculates the value of an investment given the initial amount *PV*, the annual interest rate *i*, and the number of years to invest *n*. Use the following formula to calculate the future value:

![Compound Interest Equation](https://upload.wikimedia.org/math/e/0/c/e0ca87a82c591a0e0610792963751fd5.png)

Add your code to `calculator.rb`.

### Sample Usage

```no-highlight
$ ruby calculator.rb
What is the amount being invested: 1000
What is the annual interest rate (percentage): 10
How many years will it accrue interest: 25

The final value will be $10834.71 after 25 years.
```

### Tips

* The following snippet can be used to prompt the user for a number and store their input in a variable:

```ruby
print "Enter some value: "
some_value = gets.chomp.to_f
```

* To raise some number *b* to a power *n* (i.e. *b<sup>n</sup>*) we can use the `**` operator in Ruby:

```ruby
10 ** 2 #=> 100
4 ** 3 #=> 64
```

* The **printf** method can be used to format numbers with a specific number of decimal places. There are two parts to a `printf` call: the format string and the values to inject:

```ruby
pi = 3.14159
meaning_of_life = 42

printf("a format string with placeholders %f and %d\n", pi, meaning_of_life)
# Outputs "a format string with placeholders 3.141590 and 42"
```

The format string contains placeholders using the **%** symbol. These placeholders can represent a real number (**%f** for [floating-point][floating-point] number), an integer (**%d**), or another string (**%s**), among others. The benefit of using these placeholders is that we can specify how they appear by adding modifiers. To print out the decimal value with two decimal places, we use **%.2f** instead of **%f**:

```ruby
pi = 3.14159
printf("The value of Pi is %.2f\n", pi)
# Outputs "The value of Pi is 3.14"
```

`printf` can be used when we need more control over the formatting than `puts` or `print` gives us. More documentation for the available options can be found on the [**sprintf**][sprintf] documentation page or on [Wikipedia][printf-format-string].

[sprintf]: http://ruby-doc.org/core-1.9.3/Kernel.html#method-i-sprintf
[printf-format-string]: http://en.wikipedia.org/wiki/Printf_format_string
[floating-point]: http://en.wikipedia.org/wiki/Floating_point
