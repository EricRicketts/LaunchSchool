require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise < Minitest::Test

=begin
Short Long Short

Write a method that takes two strings as arguments, determines the longest of the two strings,
and then returns the result of concatenating the shorter string, the longer string,
and the shorter string once again. You may assume that the strings are of different lengths.

Examples:

short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

Input: guaranteed to be two strings of different lengths
Output: 1 string

Algorithm:
  - str1 <= str2 then str1 + str2 + str1
  - else str2 + str1 + str2
=end

  def short_long_short(str1, str2)
    str1.length <= str2.length ? str1 + str2 + str1 : str2 + str1 + str2
  end

  def test_one
    assert_equal('abcdefghabc', short_long_short('abc', 'defgh'))    
  end
  
  def test_two
    assert_equal('fghabcdefgh', short_long_short('abcde', 'fgh'))    
  end
  
  def test_three
    assert_equal('xyz', short_long_short('', 'xyz'))    
  end
  
end

class FirstExerciseLSClever < Minitest::Test

=begin
LS Clever solution they said the original solution was more understandable
than this "clever" solution, but I wanted to include it.

# the sort by string length guarantees the shorter string will be first
=end
  def short_long_short(str1, str2)
    arr = [str1, str2].sort_by {|str| str.length}
    arr.first + arr.last + arr.first
  end

  def test_one
    assert_equal('abcdefghabc', short_long_short('abc', 'defgh'))    
  end
  
  def test_two
    assert_equal('fghabcdefgh', short_long_short('abcde', 'fgh'))    
  end
  
  def test_three
    assert_equal('xyz', short_long_short('', 'xyz'))    
  end
  
end