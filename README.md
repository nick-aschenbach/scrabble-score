# ScrabbleScore

A simple Scrabble cheating library that estimates word score. Given a set of letters, one can search for all
permutation against the SOWPODS dictionary. For example:

```
ScrabbleScore::WordFinder.new.search_with_score('uiqza')
```

Which returns:

```
{"qi"=>11, "za"=>11, "ai"=>2, "qua"=>12, "quiz"=>22, "quai"=>13}
```

## Installation

Add this line to your application's Gemfile:

    gem 'scrabble_score'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install scrabble_score

## Usage

One can search for words in the dictionary without score estimates via the following Ruby script:

```
require 'scrabble_score'

finder = ScrabbleScore::WordFinder.new
p finder.search('foobar')
```

While the WordFinder uses the SOWPODS dictionary, it's possible to replace it with your own:

```
dictionary = ScrabbleScore::Dictionary.new(%w[apple pear banana])
ScrabbleScore::WordFinder.new(dictionary)
```

The dictionary can be searched directly:

```
dictionary = ScrabbleScore::Dictionary.new
dictionary.contains('vermilion') # returns true
```

In addition the letter permutation can be used independently from the other components:

```
letters = ScrabbleScore::Letters.new('xyz')
letters.permutations # returns ["xy", "xz", "yx", "yz", "zx", "zy", "xyz", "xzy", "yxz", "yzx", "zxy", "zyx"]
```

Note that this will only show permutations from two letters up to the size of the input string.



## Contributing

1. Fork it ( https://github.com/[my-github-username]/scrabble_score/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
