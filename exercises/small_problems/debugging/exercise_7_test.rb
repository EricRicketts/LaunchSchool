require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise7Test < Minitest::Test
  attr_accessor :sentence
=begin
  this fails becasue we are modifying the array as we iterate
  over it.  Because we do this, we skip one of the words.  For
  the first word "These" there is no deletion, for the second word
  "dull" there is a deletion, now "dull" was index 1, but with the
  deletion, 'boring' is now index 1 and the next index to servivce
  will be index 2 which is now 'cards' to 'boring' was skipped over.
=end

  def setup
    @sentence = 'These dull boring cards are part of a chaotic board game.'
  end

  def neutralize(sentence)
    words = sentence.split(' ')
    words.each do |word|
      words.delete(word) if negative?(word)
    end

    words.join(' ')
  end

  def neutralize_fix(sentence)
    sentence.split(' ').reject { |word| negative?(word) }.join(' ')
  end

  def negative?(word)
    %w[dull boring annoying chaotic].include?(word)
  end

  def test_wrong_answer
    wrong_answer = "These boring cards are part of a board game."
    assert_equal(wrong_answer, neutralize(sentence))
  end

  def test_fix
    expected = 'These cards are part of a board game.'
    assert_equal(expected, neutralize_fix(sentence))
  end
end
