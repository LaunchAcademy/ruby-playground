### Instructions

Write a program to calculate and print the average, max, and min grades for a list of students. The student information is provided in JSON format in the `students.json` file.

### Learning Goals

* Extract information from a JSON file using Hashes and Arrays.
* Iterate over an array to calculate the average, max, and min.
* Print formatted output.

### Sample Output

Each student and their average, max, and min grades should be on a separate line:

```no-highlight
$ ruby grades.rb
Julian      75.00     80     68
Bubbles     92.50     98     82
Ricky        1.25      5      0
Randy       72.25     90     52
Lucy        83.25     90     74
J-Roc       30.75     51      1
```

The exact formatting isn't important although you can use the `printf` method to specify the number of decimal places and spacing around different fields:

```ruby
# This will output a string similar to the lines displayed in the sample output.
printf("%-10s %6.2f %6d %6d\n", name, average, max, min)
```
