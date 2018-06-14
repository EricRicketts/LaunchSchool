require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

=begin
Convert A String To A Number

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer.
String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby, such as String#to_i, Integer(), etc.
Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples

string_to_integer('4321') == 4321
string_to_integer('570') == 570

Input: string of number chars
Output: a number

Algorithm:
  - str.chars.reverse to get chars in proper ordinal position with respect to array
  - now index provies power of ten for each digit
  - I need a hash which maps each digit char to an integer
  - sum += digit * (10**index)
=end

  CHAR_TO_DIGIT = ('0'..'9').to_a.zip((0..9).to_a).to_h

  def string_to_integer(str)
    str.chars.reverse.each.with_index.inject(0) {|sum, (n, idx)| sum += CHAR_TO_DIGIT[n]*(10**idx)}
  end

  def test_one
    assert_equal(4321, string_to_integer('4321'))
  end
  
  def test_two
    assert_equal(570, string_to_integer('570'))
  end
  
end

class SeventhExerciseKyleZhao < Minitest::Test

=begin
say we have the number 570, chars are ['5', '7', '0']
by inject(0) sum is initialized to 0

1st iteration: 0*10 + ('1'..'5').count = 0 + 5 = 5
2nd iteration: 5*10 + ('1'..'7').count = 50 + 7 = 57
3rd iteration: 57*10 + ('1'..'0').count = 570 + 0 = 570
=end

  def string_to_integer(str)
    str.chars.inject(0) {|sum, n| sum = sum*10 + ('1'..n).count}
  end

  def test_one
    assert_equal(4321, string_to_integer('4321'))
  end
  
  def test_two
    assert_equal(570, string_to_integer('570'))
  end
  
end