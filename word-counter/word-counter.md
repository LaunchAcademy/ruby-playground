### Instructions

Write a program to print out the most common words found in a text file. The program should print out the **n** most common words with their counts found in a given file where both the filename and **n** are supplied on the command line.

There are several sample e-books included with the challenge courtesy of [Project Gutenberg][gutenberg] that can be used to test out the word counter.

### Learning Goals

* Reading data from the file system.
* Utilizing hashes as an efficient data structure for counting.

#### Extra Challenge - Stop Words

Many of the most common words found in books do not have much significance. Words such as *the*, *and*, *of*, and so on appear frequently but do not provide much information about the work they appear in. These are often referred to as **stop words** and are usually ignored when parsing natural text.

As an additional challenge, ignore any of the words that appear in `stop_words.txt` when parsing the given file.

### Sample Usage

Pass both the filename to read and the limit to how many words you want printed out:

```no-highlight
$ ruby word_counter.rb poe_usher.txt 10

the: 553
of: 412
and: 240
i: 163
a: 156
in: 140
to: 118
which: 93
his: 86
was: 79
```

After taking into account stop words:

```no-highlight
$ ruby word_counter.rb poe_usher.txt 20

upon: 53
now: 20
long: 19
usher: 19
yet: 18
thus: 16
one: 15
house: 14
certain: 12
character: 12
door: 12
however: 11
portion: 11
within: 11
even: 11
many: 11
wild: 10
words: 10
family: 9
shall: 9
```

### Tips

* The `sort_by` method can be used on a Hash to return an ordered set of key-value pairs. Note that this does not return another Hash but rather an Array of Arrays.
* Word counting is more effective if the input is sanitized first. This often involves stripping out most punctuation and downcasing all letters. The `gsub` method can be used to strip characters that don't match a particular pattern in a string.

[gutenberg]: https://www.gutenberg.org/
