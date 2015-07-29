Snoop Dogg loves coffee makers. In his spare time, he reads coffee maker reviews wherever he can find them. He's decided to include key phrases from these reviews into his next album and needs help finding positive reviews.

### Learning Objectives

* Learn how to scrape information from a website and extract relevant information.
* Use the [Net::HTTP library][net-http-library] to retrieve web pages programatically.

### Instructions

Scrape review websites for coffee reviews and return sentences that have common words used in coffee maker reviews.

### Sample Usage

```no-highlight
$ ./coffee-reviews.rb

Here's what I love about the Keurig: it makes GREAT coffee every time.
Simple to use and easy to clean.
This is a cheap coffee pot that works great.
Makes great coffee and is very easy to use.
...
```

### Hints

* Think about where you can find information on coffee makers. [Amazon][amazon-coffee-makers] might be a good place to start. How can you access this information from a ruby program?
* Once you have some HTML, look at the [Nokogiri][nokogiri] gem for ways to extract information from it.
* How can you tell if a review is positive or not? If the web page provides some ratings with each review you can use those, or consider some simple sentiment analysis tools to decide on whether or not a review is positive or negative.
* Think back to your word counter and figure out how you might expand it to return sentences that have common words.
* Don't try to implement the entire program at once. Start small: scrape a single web page and print all of the reviews. Once that is working, add small features incrementally until you have a complete working program.
* There are a lot of parameters for this challenge: how many pages to scrape, how many reviews to parse, how many sentences to print, and so on. Choose sensible defaults and tweak these values until you receive the output you desire.

[nokogiri]: http://www.nokogiri.org/
[net-http-library]: http://ruby-doc.org/stdlib-2.1.5/libdoc/net/http/rdoc/Net/HTTP.html
[amazon-coffee-makers]: http://www.amazon.com/Drip-Coffee-Machines-Makers/b?ie=UTF8&node=289745
