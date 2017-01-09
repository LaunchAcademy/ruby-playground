### Instructions

Write a program to translate English sentences into [Pig Latin][wikipedia]. Implement the `translate` method in **translate.rb** so that it returns the Pig Latin translation of the given English sentence.

The **test.rb** file contains several examples that should pass once the `translate` method is complete. Running `ruby test.rb` will raise an exception if any of the tests are failing.

#### Rules

Sentences can be translated from English to Pig Latin by applying a set of rules to each word in the sentence. The rules are as follows:

* If the word begins with a consonant or consonant cluster, move the consonant(s) to the end of the word and append *ay* (e.g. **happy** becomes **appyhay**, **child** becomes **ildchay**).

* If the word begins with a vowel append *way* to the end of the word (e.g. **egg** becomes **eggway**).

### Sample Usage

```no-highlight
$ ruby translate.rb these pretzels are making me thirsty
esethay etzelspray areway akingmay emay irstythay
```

[wikipedia]: http://en.wikipedia.org/wiki/Pig_Latin
