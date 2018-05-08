require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class EighthExercise < Minitest::Test

=begin
In the previous exercise, you developed a method that converts simple numeric strings to Integers.
In this exercise, you're going to extend that method to work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
The String may have a leading + or - sign; if the first character is a +, your method should return a positive number;
if it is a -, your method should return a negative number. If no sign is given, you should return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc. You may, however, use the string_to_integer method from the previous lesson.

Examples

string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

Input: string of digits preceeded by
  - '-', '+', or nothing
Output: Signed integer
  - either - when '-' on input
  - nothing preceeds first integer when '+' or nothing on input

Algorithm:
  - If preceeded by '-'
    - remove from string
    - call #string_to_integer
    - multiply output by -1
  - If preceeded by '+'
    - remove from string
    - call #string_to_integer
  - If preceeded by nothing 
    - call #string_to_integer
=end

  CHAR_TO_DIGIT = ('0'..'9').to_a.zip((0..9).to_a).to_h

  def string_to_integer(str)
    str.chars.reverse.each.with_index.inject(0) {|sum, (n, idx)| sum += CHAR_TO_DIGIT[n]*(10**idx)}
  end

  def string_to_signed_integer(str)
    sign = str[0]
    integer_sign = sign == "-" ? -1 : 1
    case sign
    when "-", "+" then integer_sign*string_to_integer(str[1..-1])
    else string_to_integer(str)   
    end
  end

  def test_one
    assert_equal(4321, string_to_signed_integer('4321'))      
  end

  def test_two
    assert_equal(-570, string_to_signed_integer('-570'))      
  end

  def test_three
    assert_equal(100, string_to_signed_integer('+100'))      
  end

end

class EighthExerciseKyleZhao < Minitest::Test

=begin
Here's a fairy condensed one that works because '+' and '-' have ASCII numbers lower than '1'. So...

"sum * 10" remains 0 for str[0] and str[1] when there is a leading sign; this is because...

"('1'..char).count" returns 0 for '-' and '+'

=end


  def string_to_signed_integer(str)
    output = str.chars.inject(0) { |sum, char| sum = sum * 10 + ('1'..char).count }
    str[0] == '-' ? -output : output
  end

  def test_one
    assert_equal(4321, string_to_signed_integer('4321'))      
  end

  def test_two
    assert_equal(-570, string_to_signed_integer('-570'))      
  end

  def test_three
    assert_equal(100, string_to_signed_integer('+100'))      
  end
  
end