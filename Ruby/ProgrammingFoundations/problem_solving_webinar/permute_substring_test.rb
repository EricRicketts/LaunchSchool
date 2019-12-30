require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Write a method that returns a list of all substrings in a string.  The returned list should be ordered by where
in the string the substring begins.  This means that all of the substings that begin at position 0 should start
first, then all of the substrings that begin at postion 1 and so on.  Since multiple substrings will occur at
each position, the substrings at a given position should be returned in order from shortest to longest.

Example:
substring('abcde')
[
'a', 'ab', 'abc', 'abcd', 'abcde',
'b', 'bc', 'bcd', 'bcde',
'c', 'cd', 'cde',
'd', 'de',
'e'
]

Inputs:
1.  Just one string
2.  Upper and lower case should not matter

Outputs:
1.  An array of strings

Data Structure
1.  convert the given string into an array of characters

Algorithm
1.  Try to create 'a', 'ab', 'abc', 'abcd', 'abcde' in irb using slice
    - In the above case start = index 0 and end = index 0, this gives us 'a'
    - then start = index 0 end = index 1, then start = index 0 end = index 2
    - first give us 'abcde', 'bcde', 'cde', 'de', 'e'
    - use map to advance along each letter and then slice the array to the end
2.  Then use that same technique to iterate through the letters one by one
=end

class PermuteSubstringTest < Minitest::Test

  def substring(str)
    last_index = str.length - 1
    char_ary = str.chars
    ary_of_arys_of_chars = char_ary.map.with_index {|letter, index| char_ary[index..last_index]}

    ary_of_arys_of_chars.map do |ary_of_letters|
      ary_of_letters.map.with_index do |letter, index|
        ary_of_letters[0..index].join
      end
    end.flatten
  end

  def substring_ver2(str)
    temp = []
    last_index = str.length - 1
    char_ary = str.chars
    ary_of_arys_of_chars = char_ary.map.with_index {|letter, index| char_ary[index..last_index]}

    ary_of_arys_of_chars.map do |ary_of_letters|
      for index in (0...ary_of_letters.length)
        temp.push(ary_of_letters[0..index].join)
      end
    end
    temp.flatten
  end

  def test_permute_string
    expected = ['a', 'ab', 'abc', 'abcd', 'abcde',
      'b', 'bc', 'bcd', 'bcde',
      'c', 'cd', 'cde',
      'd', 'de',
      'e']
    assert_equal(expected, substring('abcde'))   
  end
  
  def test_permute_string_v2
    expected = ['a', 'ab', 'abc', 'abcd', 'abcde',
      'b', 'bc', 'bcd', 'bcde',
      'c', 'cd', 'cde',
      'd', 'de',
      'e']
    assert_equal(expected, substring_ver2('abcde'))   
  end
  
end