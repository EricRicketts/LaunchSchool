require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class TenthExercise < Minitest::Test

=begin
Convert A Signed Number To A String

In the previous exercise, you developed a method that converts non-negative numbers to strings.
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby, such as Integer#to_s, String(),
Kernel#format, etc. You may, however, use integer_to_string from the previous exercise.

Examples

signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

Input: A number
  - positive has no sign
  - negative has - sign
  - 0 is 0

Output: A string
  - prefixed with '-' if number < 0
  - prefixed with '+' if number > 0
  - '0' if 0

Algorithm:
  - Output above produces the necessary branching statements
=end

DIGIT_TO_CHAR = (0..9).to_a.zip(('0'..'9').to_a).to_h

  def integer_to_string(number)
    number.digits.reverse.map {|digit| DIGIT_TO_CHAR[digit]}.join
  end

  def signed_integer_to_string(number)
    sign = number < 0 ? '-' : '+'
    number != 0 ? sign + integer_to_string(number.abs) : '0'
  end

  def test_one
    assert_equal('+4321', signed_integer_to_string(4321))
  end
  
  def test_two
    assert_equal('-123', signed_integer_to_string(-123))
  end

  def test_three
    assert_equal('0', signed_integer_to_string(0))
  end
  
end

class TenthExerciseLS < Minitest::Test

=begin
I really like how LS solved the problem, they made use
of the spaceship operator <=> to get -1 or +1, note for
the -1 case the number had to be made negative.  
=end

  DIGIT_TO_CHAR = (0..9).to_a.zip(('0'..'9').to_a).to_h

  def integer_to_string(number)
    number.digits.reverse.map {|digit| DIGIT_TO_CHAR[digit]}.join
  end

  def signed_integer_to_string(number)
    case number <=> 0
    when -1 then "-#{integer_to_string(-number)}"
    when +1 then "+#{integer_to_string(number)}"
    else         integer_to_string(number)
    end
  end

  def test_one
    assert_equal('+4321', signed_integer_to_string(4321))
  end
  
  def test_two
    assert_equal('-123', signed_integer_to_string(-123))
  end

  def test_three
    assert_equal('0', signed_integer_to_string(0))
  end  
  
end