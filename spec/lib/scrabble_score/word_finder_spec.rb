require 'spec_helper'

describe ScrabbleScore::WordFinder do
  describe '#search' do
    let(:empty_dictionary) { ScrabbleScore::Dictionary.new([]) }
    it 'permutates the input' do
      expect_any_instance_of(ScrabbleScore::Letters).to receive(:permutations).and_call_original

      ScrabbleScore::WordFinder.new(empty_dictionary).search('foo')
    end

    it 'searches its dictionary for permutations' do
      expect_any_instance_of(ScrabbleScore::Letters).to receive(:permutations).and_return(['bar'])
      expect_any_instance_of(ScrabbleScore::Dictionary).to receive(:contains).with('bar')

      ScrabbleScore::WordFinder.new(empty_dictionary).search('anything')
    end

    it 'returns permutations that are words in the dictionary' do
      dictionary = %w[stop pot top sop to]
      word_finder = ScrabbleScore::WordFinder.new(ScrabbleScore::Dictionary.new(dictionary))

      expect(word_finder.search('opt')).to match_array(%w[pot top to])
    end
  end

  describe '#search_with_score' do
    it 'returns a hash of (word, score) pairs' do
      dictionary = %w[flavor or fav rat trap]
      word_finder = ScrabbleScore::WordFinder.new(ScrabbleScore::Dictionary.new(dictionary))

      expected_hash = {'flavor' => 12, 'or' => 2, 'fav' => 9}
      expect(word_finder.search_with_score('lovrfa')).to eq(expected_hash)
    end
  end
end