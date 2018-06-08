require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to it's position in the alphabet: a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.


# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aa b') == 'aa'



=begin
  - Hash which maps the letters to integers
  - create an array of words by splitting the string
  - initialize a hash to 0
  - iterate this array of words
    - for each word do the following
    - if the word length is greater then the max length
      then that word is the new max word and the word length is the max word length
=end


# # check the value of first word, compare to max i it is greater that this is my max_word if it is not move to the next word

# p high('man i need a taxi up to ubud') == 'taxi'
# p high('what time are we climbing up the volcano') == 'volcano'
# p high('take me to semynak') == 'semynak'
# p high('aa b') == 'aa'

class Session11Test < Minitest::Test

  LETTER_VALUES = ('a'..'z').zip(1..26).to_h

  def high(str)
    max_value = 0
    largest_word = ''
    str.split.each do |word|
      word_value = word.chars.map {|char| LETTER_VALUES[char]}.sum
      if word_value > max_value
        max_value = word_value
        largest_word = word
      end
    end
    largest_word
  end

  def test_0
    # skip
    expected = 'taxi'
    result = high('man i need a taxi up to ubud')
    assert_equal(expected, result)
  end
  
  def test_1
    # skip
    expected = 'volcano'
    result = high('what time are we climbing up the volcano')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 'semynak'
    result = high('take me to semynak')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 'aa'
    result = high('aa b')
    assert_equal(expected, result)
  end
  
end