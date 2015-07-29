# Amazon Orders

You have a serious online shopping addiction and order way too much stuff on Amazon.  You need an app to track your Amazon orders so your friends can stage an intervention. Your app should have an `Order` class representing each online order you place, and an `Item` class representing an item on an order.

## Instructions

### Item

Create an `Item` class that represents an item on an order.  It should contain the following methods:

* `name` returns the name of the item.
* `description` returns a description of the item, if the item has a description.
* `manufacturer` returns the manufacturer of the item.
* `price` returns the price of the item.
* `summary` returns a summary of information about the item that looks like this:

```no-highlight
Name: Magnifying Glass
Description: Great for inspecting clues.
Manufacturer: Spys-R-Us
Price: $5.75
```

### Order

Create an `Order` class to represent your Amazon order.  It should have the following methods:

* `customer` returns the name of the customer who placed the order.
* `placed_at` returns the date and time the order was placed.
* `payment_method` returns the type of payment (credit, debit, or PayPal, for example)
* `shipping_address` returns the shipping address (a string including the street address, city, state, and zip code).
* `items` returns an array of the items on the order (each of which should be an `Item` object).
* `total` returns the total cost of the items on the order.
* `summary` returns a summary of information about the order.  It should look something like this:

```no-highlight
Date: 12/10/2014
Customer: Gene Parmesan
Payment method: PayPal
Shipping address: 100 Spy Street, Newport Beach, CA 92625

Items:

Name: Magnifying Glass
Description: Great for inspecting clues.
Manufacturer: Spys-R-Us
Price: $5.75

Name: Spy Notebook
Description: Great for writing down clues.
Manufacturer: Spys-R-Us
Price: $10.50

Name: Detective Hat
Description: Great for looking like Sherlock Holmes.
Manufacturer: Private Investigator Suppliers
Price: $19.95

Total: $36.20
```

## Setup

Placeholders for both classes can be found in lib/item.rb and lib/order.rb. A test suite for the two classes has been supplied and can be run with the following command:

```no-highlight
$ rspec spec
```

You should receive the following errors:

```no-highlight
FFFFFFFF

Failures:

1) Item has a name
Failure/Error: Item.new(
  ArgumentError:
  wrong number of arguments (1 for 0)
  # ./spec/item_spec.rb:5:in `initialize'
  # ./spec/item_spec.rb:5:in `new'
  # ./spec/item_spec.rb:5:in `block (2 levels) in <top (required)>'
  # ./spec/item_spec.rb:22:in `block (2 levels) in <top (required)>'

2) Item has a manufacturer
Failure/Error: Item.new(
  ArgumentError:
  wrong number of arguments (1 for 0)
  # ./spec/item_spec.rb:5:in `initialize'
  # ./spec/item_spec.rb:5:in `new'
  # ./spec/item_spec.rb:5:in `block (2 levels) in <top (required)>'
  # ./spec/item_spec.rb:26:in `block (2 levels) in <top (required)>'

< ... more errors / failures here ... >

Finished in 0.00357 seconds (files took 0.14391 seconds to load)
8 examples, 8 failures

Failed examples:

rspec ./spec/item_spec.rb:21 # Item has a name
rspec ./spec/item_spec.rb:25 # Item has a manufacturer
rspec ./spec/item_spec.rb:29 # Item has a price
rspec ./spec/item_spec.rb:33 # Item has an optional description
rspec ./spec/item_spec.rb:39 # Item#summary returns summary information with a description
rspec ./spec/item_spec.rb:50 # Item#summary returns summary information without a description
rspec ./spec/order_spec.rb:29 # Order#total returns the total cost of the items
rspec ./spec/order_spec.rb:35 # Order#summary returns summary information
```

Review the files in the `spec` directory to determine how the `Order` and `Item` classes are used. Start by implementing the `Item` class. Once all of the tests for that are passing, implement the `Order` class.
