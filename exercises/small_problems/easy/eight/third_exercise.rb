=begin
Leading Substrings

Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
The return value should be arranged in order from shortest to longest substring.

Examples:

substrings_at_start('abc') == Write a method that returns a list of all substrings of a string that
start at the beginning of the original string. The return value should be arranged in order from shortest to longest substring.

Examples:

substrings_at_start('abc') == ['a', 'ab', 'abc']
substrings_at_start('a') == ['a']
substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

I: string, guaranteed 1 letter
O: array

AL
  - ary = []
  - get last index
  - 0.upto(last_index)
  - ary.push(str[0..index])
  - return ary
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class ThirdExercise < Minitest::Test
=begin
my solution was essentially the same as
the LS solution
=end

  def substrings_at_start(str)
    array = []
    last_index = str.length - 1
    0.upto(last_index) do |idx|
      array.push(str[0..idx])
    end
    array
  end

  def test_1
    # skip
    expected = ['a', 'ab', 'abc']
    result = substrings_at_start('abc')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = ['a']
    result = substrings_at_start('a')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
    result = substrings_at_start('xyzzy')
    assert_equal(expected, result)
  end
  
end

class ThirdExerciseAlternateSolution < Minitest::Test
=begin
my original code was
str.chars.map.with_index {|char, idx| str[0..idx]}
one below is better as it only uses the index instead
of not using the character itself
=end

  def substrings_at_start(str)
    str.chars.each_index.map {|idx| str[0..idx]}
  end

  def test_1
    # skip
    expected = ['a', 'ab', 'abc']
    result = substrings_at_start('abc')
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = ['a']
    result = substrings_at_start('a')
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
    result = substrings_at_start('xyzzy')
    assert_equal(expected, result)
  end
  
end