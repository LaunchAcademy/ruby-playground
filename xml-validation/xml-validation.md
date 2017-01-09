Extensible Markup Language, or XML, is a text format designed for ease of use in electronic publishing and the exchanging of data through the Web. While similar to HTML in practice, the two differ in an important respect: XML is designed for the _description_ of data whereas HTML is designed for the _depiction_ of data on a web page.

#### What is valid XML?

Here is an example of a valid XML document:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<note>
<to>Dr. Dre</to>
<from>Eminem</from>
<heading>I need a doctor</heading>
<body>I'm about to lose my mind</body>
</note>
```

In a valid XML document like the one above, opened tags have associated closing tags in the correct position. If a tag is missing or in the wrong order, the document is not valid XML format. Take a look at the following XML:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<note>
<to>2Pac's Mother</to>
<from>2Pac</from>
<heading>Dear Mama</heading>
<body>Pour out some liquor and I reminsce, cause through the drama</body>
```

The missing `</note>` tag at the bottom of the following would result in an invalid XML file because the original `<note>` tag is never closed.

### Learning Goals

* A _very_ brief introduction to Extensible Markup Language (XML)
* Understand what validating a document in a particular format entails
* Learn how to implement stacks in Ruby

### Instructions

Write a program called `xml_validator.rb` that validates whether or not a document is valid XML. The program should accept the filename for the document as a command-line argument in the format of `ruby xml_validator.rb <xml-filepath>` and output **VALID** or **INVALID**.

The criteria for a well-formed XML document include:

* Any opening elements have a corresponding closing element.
* Elements are closed in the reverse order that they were opened (i.e. first element opened is the last element closed).
* Self-closing elements (e.g. `<foo />`), XML declarations (e.g. `<?xml ...?>`), and DOCTYPE elements (e.g. `<!DOCTYPE ...>`) do not have closing elements.
* There is only a single root element.

This challenge includes a few sample XML files which you can test against in the `samples` directory.

### Sample Usage

```no-highlight
$ ruby xml_validator.rb samples/valid/books.xml
VALID

$ ruby xml_validator.rb samples/invalid/missing-tag.xml
INVALID
```

### Tips

A **stack** is a useful data structure for maintaining state with nested information such as XML. [Rubymonk][rubymonk] has some great resources on implementing arrays as stacks and queues.

[rubymonk]: http://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/33-advanced-arrays/lessons/86-stacks-and-queues
