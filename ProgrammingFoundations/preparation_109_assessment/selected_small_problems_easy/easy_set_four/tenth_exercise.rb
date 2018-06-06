require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Convert A Signed Numbrer To A String

In the previous exercise, you developed a method that converts non-negative numbers to strings.
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s,
String(), Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

AL:
  - Have a hash which maps integers to strings
  - loop where number.divmod(10)
    - num, digit = number.divmod(10)
    - str.prepend(HASH[digit])
    - number = num
    - break if num is = 0 from divmod operation
=end

class TenthExercise < Minitest::Test

  DIGIT_CONVERSTION = (0..9).zip('0'..'9').to_h

  def signed_integer_to_string(number)
    return '0' if number.zero?
    num_str = ''
    sign = number < 0 ? "-" : '+'
    number = number.abs
    until number.zero?
      num, digit = number.divmod(10)
      num_str.prepend(DIGIT_CONVERSTION[digit])
      number = num
    end
    num_str.prepend(sign)    
  end

  def test_0
    # skip
    assert_equal('+4321', signed_integer_to_string(4321))
  end 

  def test_1
    # skip
    assert_equal('-123', signed_integer_to_string(-123))
  end 

  def test_2
    # skip
    assert_equal('0', signed_integer_to_string(0))
  end 

end