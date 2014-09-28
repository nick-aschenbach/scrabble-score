require 'set'

module ScrabbleScore
  class Dictionary
    attr_reader :words

    def initialize(words = nil)
      @words = words.to_set and return unless words.nil?

      load_words_from_dictionary
    end

    def contains(word)
      @words.include?(word.downcase)
    end

    private

    def load_words_from_dictionary
      @words = Set.new
      path = File.join(ScrabbleScore::ROOT, 'assets', 'dictionary.txt')
      file = File.open(path, 'r')
      file.each_line do |line|
        @words.add(line.chomp)
      end
      file.close
    end
  end
end
