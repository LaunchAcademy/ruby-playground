### Instructions

Everyone is familiar with the page links at the bottom of a Google search. How exactly do they implement this feature? It always shows 10 page links, 10 results per page, with the current page in the center of the list.

![Google Pagination Image](http://i.imgur.com/MDpBwqm.png)

Write a method that returns an array of page numbers to display when given:
  * The number of results to display per page.
  * The total number of pages to display in the list.
  * The total number of results.
  * The current page.

### Sample Usage

```ruby
results_per_page = 10
max_pages = 10
results_count = 392
current_page = 8

paginate(current_page, results_count, max_pages, results_per_page)
  => [4, 5, 6, 7, 8, 9, 10, 11, 12, 13]
```

Install rspec, if necessary, and run the test suite
```no-highlight
$ gem install rspec
Successfully installed rspec-3.1.0
1 gem installed

$ rspec pagination_spec.rb --fail-fast --color
F

Failures:

  1) #paginate should return an array
     Failure/Error: pages = paginate(1, 100, results_per_page, max_pages)
     NameError:
       undefined local variable or method `results_per_page' for #<RSpec::ExampleGroups::Paginate:0x007fc2a419a7f8>
     # ./pagination_spec.rb:11:in `block (2 levels) in <top (required)>'

Finished in 0.00049 seconds (files took 0.12565 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./pagination_spec.rb:10 # #paginate should return an array
```

### Tips

* Pseudocode your solution before you start coding.
* Let the test suite provided guide you to a solution.
* Start simple. Get your code working for an easy case first. Then, move to a more complex case.
* Methods that might be useful:
  * `.ceil`
  ```
  (9 / 2.0).ceil # => 5
  ```
  * `.floor`
  ```
  (9 / 2.0).floor # => 4
  ```
* Look into 'optional method parameters' for Ruby methods.
