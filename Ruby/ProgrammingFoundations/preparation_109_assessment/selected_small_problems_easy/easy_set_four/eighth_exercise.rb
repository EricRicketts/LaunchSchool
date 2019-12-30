require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Convert A String To A Signed Number!

In the previous exercise, you developed a method that converts simple numeric strings to Integers.
In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
The String may have a leading + or - sign; if the first character is a +, your method should
return a positive number; if it is a -, your method should return a negative number.I
f no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby,
such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

AL:
  - have a hash for all digits
  - check for (-) if exists append, if not no sign
  - reverse the string digits
  - for each digit convert to number using the hash
  - then sum the number with each number * 10^power, power being array index
=end

class EighthExercise < Minitest::Test

  DIGIT_CONVERSION = ('0'..'9').zip(0..9).to_h

  def string_to_signed_integer(str)
    sign = str[0] == "-" ? -1 : 1
    num_str = str.match(/[[:digit:]]+/)[0]
    sign*num_str.chars.reverse.each.with_index.inject(0) do |number, (digit, index)|
      number += DIGIT_CONVERSION[digit]*10**(index)
    end   
  end

  def test_0
    # skip
    assert_equal(4321, string_to_signed_integer('4321'))
  end
  
  def test_1
    # skip
    assert_equal(-570, string_to_signed_integer('-570'))
  end
  
  def test_2
    # skip
    assert_equal(100, string_to_signed_integer('+100'))
  end
  
end