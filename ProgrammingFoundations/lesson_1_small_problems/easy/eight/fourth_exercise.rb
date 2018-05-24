=begin
All Substrings

Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring begins.
This means that all substrings that start at position 0 should come first, then
all substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned in
order from shortest to longest.

You may (and should) use the substrings_at_start method you wrote in the previous exercise:

Examples:

substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

I: A string
O: An array of all possible substrings

AL
  - have an outer loop which yields a new string each time
  by taking the index of the current character string and slicing
  to the end of the string, for example at index = 0 we have
  str[0..-1] = 'abcde' at index = 1 we have str[1..-1] = 'bcde'
  - have an inner loop which takes the given string and creates
  an array of substrings from index = 0 to the given index, for
  example substring[0..idx] would give substring[0..0], substring[0..1]
  and so on
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

def substrings(str)
  last_index = str.length - 1
  ary = []
  0.upto(last_index) do |idx|
    substring = str[idx..-1]
    substr_last_idx = substring.length - 1
    0.upto(substr_last_idx) do |i|
      ary.push(substring[0..i])
    end 
  end
  ary
end

  def test_1
    # skip
    expected = [
      'a', 'ab', 'abc', 'abcd', 'abcde', 
      'b', 'bc', 'bcd', 'bcde',
      'c', 'cd', 'cde',
      'd', 'de',
      'e']
    result = substrings('abcde')
    assert_equal(expected, result)
  end
  
end

class FourthExerciseAltSol < Minitest::Test

  def substrings(str)
    str.chars.each_index.map do |idx|
      substring = str[idx..-1]
      substring.chars.each_index.map {|i| substring[0..i]}
    end.flatten
  end

  def test_1
    # skip
    expected = [
      'a', 'ab', 'abc', 'abcd', 'abcde', 
      'b', 'bc', 'bcd', 'bcde',
      'c', 'cd', 'cde',
      'd', 'de',
      'e']
    result = substrings('abcde')
    assert_equal(expected, result)
  end
  
end

class FourthExerciseAltSol2 < Minitest::Test

  def substrings(str)
    str.chars.each_index.map { |idx| str[idx..-1].chars.each_index.map { |i| str[idx..-1][0..i] } }.flatten
  end

  def test_1
    # skip
    expected = [
      'a', 'ab', 'abc', 'abcd', 'abcde', 
      'b', 'bc', 'bcd', 'bcde',
      'c', 'cd', 'cde',
      'd', 'de',
      'e']
    result = substrings('abcde')
    assert_equal(expected, result)
  end
  
end

class FourthExerciseLS < Minitest::Test

  def substrings(string)
    results = []
    (0...string.size).each do |start_index|
      this_substring = string[start_index..-1]
      results.concat(substrings_at_start(this_substring))
    end
    results
  end

  def substrings_at_start(string)
    result = []
    0.upto(string.size - 1) do |index|
      result << string[0..index]
    end
    result
  end
  
  def test_1
    # skip
    expected = [
      'a', 'ab', 'abc', 'abcd', 'abcde', 
      'b', 'bc', 'bcd', 'bcde',
      'c', 'cd', 'cde',
      'd', 'de',
      'e']
    result = substrings('abcde')
    assert_equal(expected, result)
  end
  
end