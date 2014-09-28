require 'spec_helper'

describe ScrabbleScore::Letters do
  describe '.TILE_VALUES' do
    def check_tile_values(array, expected_value)
      array.each { |letter| expect(ScrabbleScore::Letters::TILE_VALUES[letter]).to be(expected_value) }
    end

    it 'has expected values' do
      check_tile_values(%w[a e i l n o r s t u], 1)
      check_tile_values(%w[d g], 2)
      check_tile_values(%w[b c m p], 3)
      check_tile_values(%w[f h v w y], 4)
      check_tile_values(%w[k], 5)
      check_tile_values(%w[j x], 8)
      check_tile_values(%w[q z], 10)
    end
  end

  describe '#word' do
    it 'returns the initialized word' do
      word = ScrabbleScore::Letters.new('apple')
      expect(word.word).to eq('apple')
    end
  end

  describe '#score' do
    it 'calculates the scrabble value for a word' do
      expect(ScrabbleScore::Letters.new('test').score).to be(4)
      expect(ScrabbleScore::Letters.new('quiz').score).to be(22)
      expect(ScrabbleScore::Letters.new('jester').score).to be(13)
    end
  end

  describe '#permutations' do
    it 'calculates all possible permutations of the letters' do
      letters = ScrabbleScore::Letters.new('abc')
      expect(letters.permutations).to match_array(['ab', 'ba', 'ac', 'ca', 'bc', 'cb', 'abc', 'acb', 'bac', 'bca', 'cab', 'cba'])
    end

    it 'generates only unique permutations' do
      letters = ScrabbleScore::Letters.new('foo')
      expect(letters.permutations).to match_array(['fo', 'of', 'oo', 'foo', 'ofo', 'oof'])
    end
  end

  describe '.cleanse' do
    it 'only saves lower case characters' do
      expect(ScrabbleScore::Letters.cleanse('AbIGwOrD')).to eq('abigword')
    end

    it 'only saves a-z characters' do
      expect(ScrabbleScore::Letters.cleanse('a!@#$%^&*()_+z')).to eq('az')
    end
  end
end