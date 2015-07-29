During the trip you saw over 200 iguanas and 40 tortoises!  Now it's time to write the
ruby program that will give a summary of your trip.  The goal of the program is to
write to the terminal an overview of all the sightings and start/end date of the trip.
Normally you can use the '+' method to combine strings together.  For this program
you should take advantage of Ruby's String Interpolation feature.  The summary should
include the start date, end date, hotel you stayed at, favorite beach, and the total
number of animals you saw.  For example:

```no-highlight
'We left March 13th for The Galapagos Islands and stayed at the BestWestern hotel.  During
the trip I saw over 240 animals. My favorite beach during the trip was Tortuga Bay.
After an amazing trip we returned on May 1st.  Can't wait to go back!'
```

Hints:

- Think about different ways of forming a big string in ruby
- Research if ruby has ways of making multi-line strings that allow for interpolation
- Remember only certain types of strings allow interpolation!
- Example of Using string interpolation: "#{10 + 10} is equal to 20."  # => "20 is equal to 20."
