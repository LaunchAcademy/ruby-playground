Werds r tuff! Don't waste those precious brain cells getting your letters right, use a computer!

Spell checkers work by looking for words that don't appear in an existing body of known words (i.e. a dictionary) and flagging them as potentially mispelled. Most spell checkers will offer suggestions for the correct spelling when a mispelled word is found.

To determine what the correct spelling is we need a way to transform a word from the incorrect spelling to a potentially correct one. If we consider how words are mispelled it's usually one of the following scenarios:

* An extra letter was added somewhere in the word.
* A letter is missing somewhere in the word.
* Adjacent letters are swapped when they shouldn't be.

By taking the mispelled word and trying out several different transformations we can see if it matches any of the words in the dictionary. For example, if we encountered the word **teh** and we tried swapping adjacent letters, we end up with two alternatives:

```no-highlight
eth
the
```

Of these two we see that `the` appears in our dictionary and is probably the correct spelling.

An issue arises when we run into multiple possibly correct spellings of a word. Consider the mispelled word **hteir**. If we try removing extra characters from different parts of the word we end up with:

```no-highlight
teir
heir
htir
htei
```

**heir** is a possible spelling but if we try swapping adjacent letters we end up with:

```no-highlight
their
hetir
htier
hteri
```

In this case **their** is also a potential spelling. In these situations we can err (intentionally avoiding pun here) on the side of whichever word appears more frequently in everyday use. Between **heir** and **their** we're more likely to encounter the latter so we can suggest that as the correct spelling.

This introduces another problem of determining how frequent certain words appear in text. We can gather this information by counting words in freely available texts to build our dictionary which will contain a collection of correctly spelled words along with their frequency of appearance.

### Learning Goals

* Utilize hashes to store word frequencies.
* Apply a variety of transformations to strings.

### Instructions

Build a spell checker program that accepts a sentence and automatically replaces mispelled words with the most likely correction. The words of the sentence should be passed along as command line arguments and the program should output the corrected sentence.

The `lotsowords.txt` file contains a large corpus of various English texts and lists of words to build your dictionary. This file was taken from [Peter Norvig's example of a spell checker in Python][norvig-spellchecker] which draws upon books from [Project Gutenberg][gutenberg] and frequent words from [Wiktionary][wiktionary] and the [British National Corpus][british-corpus].

### Sample Usage

```no-highlight
$ ./spellcheck.rb i spel reallly good
i spell really good
```

[norvig-spellchecker]: http://norvig.com/spell-correct.html
[gutenberg]: http://www.gutenberg.org/wiki/Main_Page
[wiktionary]: http://en.wiktionary.org/wiki/Wiktionary:Frequency_lists
[british-corpus]: http://www.kilgarriff.co.uk/bnc-readme.html
