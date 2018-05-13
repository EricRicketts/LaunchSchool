require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Clean Up The Words

Given a string that consists of some words and an assortment of non-alphabetic characters,
write a method that returns that string with all of the non-alphabetic characters replaced by spaces.
If one or more non-alphabetic characters occur in a row, you should only have one space in the result
(the result should never have consecutive spaces).

Examples:

cleanup("---what's my +*& line?") == ' what s my line '

I: string
O: sring

AL:
 - split on anything that is not a letter, but one or more letters
 - substitute the match with a single space using gsub
=end

class FifthExercise < Minitest::Test

  def cleanup(str)
    str.gsub(/[^a-zA-Z]+/, ' ')
  end

  def test_1
    assert_equal(' what s my line ', cleanup("---what's my +*& line?"))
  end
  
end

class FifthExerciseLS < Minitest::Test

  # I like the case insensitive usage of the Regex, so LS solution is replacing
  # each non alphabetic character with a space and the eliminating all blank spaces
  # except one
  def cleanup(str)
    str.gsub(/[^a-z]/i, ' ').squeeze(' ')
  end

  def test_1
    assert_equal(' what s my line ', cleanup("---what's my +*& line?"))
  end
    
end