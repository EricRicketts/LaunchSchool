require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class NinthExercise < Minitest::Test
 
=begin
In the previous two exercises, you developed methods that convert simple numeric strings to signed Integers.
In this exercise and the next, you're going to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s,
String(), Kernel#format, etc. Your method should do this the old-fashioned way and construct the
string by analyzing and manipulating the number.

Examples

integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

Input: An integer
Output: A string

Algorithm:
  - Using Integer#digits get an array of digits
  - reverse the array 
  - map the array of digits using the conversion hash
  - join the array
=end

  DIGIT_TO_CHAR = (0..9).to_a.zip(('0'..'9').to_a).to_h

  def integer_to_string(number)
    number.digits.reverse.map {|digit| DIGIT_TO_CHAR[digit]}.join
  end

  def test_one
    assert_equal('4321', integer_to_string(4321))     
  end

  def test_two
    assert_equal('0', integer_to_string(0))     
  end

  def test_three
    assert_equal('5000', integer_to_string(5000))     
  end

end

class NinthExerciseKyleZhao < Minitest::Test

  # below works without the Hash because join always
  # produces a string.  Very clever.
  def integer_to_string(number)
    number.digits.reverse.join
  end

  def test_one
    assert_equal('4321', integer_to_string(4321))     
  end

  def test_two
    assert_equal('0', integer_to_string(0))     
  end

  def test_three
    assert_equal('5000', integer_to_string(5000))     
  end

end