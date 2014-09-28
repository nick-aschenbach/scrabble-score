module ScrabbleScore
  class WordFinder
    def initialize(dictionary = ScrabbleScore::Dictionary.new)
      @dictionary = dictionary
    end

    def search(letters)
      permutations = ScrabbleScore::Letters.new(letters).permutations
      permutations.select! { |perm| @dictionary.contains(perm) }
    end

    def search_with_score(letters)
      found_words = search(letters)

      hash = {}
      found_words.each do |word|
        hash[word] = ScrabbleScore::Letters.new(word).score
      end

      hash
    end
  end
end