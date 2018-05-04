require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class ThirdExercise < Minitest::Test

=begin
List Of Digits

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

Input: Integer
Questions: no negative?

Output: an array of numbers where each element corresponds to each digit in the number
numbers in the array are ordered as they appear in the digit

Algorithm:
  - convert the number into a string to_s
  - all chars on the string to return an array of chars
  - use map to convert each string to a number

Another way to do it is to pick off each digit using div and subtraction
  - have an empty array
  - find the highest power of 10 represented by the. number power = number.to_s.length - 1
  - digit, remainder = number.divmod(10**power)
  - push the digit onto the array
  - set the number equal to the remainder, repeat the process
  - we should be able use a times iterator


4.downto(0) do |power|
  digit, remainder = num.divmod(10**power)
    digit_ary.push(digit)
    num = remainder
  end
=end

  def digit_list(number)
    number.to_s.chars.map {|char| char.to_i}
  end

  def digit_list_v2(number)
    # I keep forgetting to use the proc to shorten
    # the map or inject code!!
    number.to_s.chars.map(&:to_i)
  end

  def digit_list_v3(number)
    "#{number}".split(//).map(&:to_i)
  end

  def digit_list_v4(number)
    number.digits.reverse
  end

  def digit_list_v5(number)
    num = number
    digit_ary = []
    high_power = number.to_s.length - 1
    high_power.downto(0) do |power|
      digit, remainder = num.divmod(10**power)
      digit_ary.push(digit)
      num = remainder
    end
    digit_ary    
  end

  def test_12345
    expected = (1..5).to_a
    assert_equal(expected, digit_list(12345))      
  end

  def test_7
    assert_equal([7], digit_list(7))      
  end

  def test_375290
    expected = [3, 7, 5, 2, 9, 0]
    assert_equal(expected, digit_list(375290))      
  end

  def test_444
    assert_equal(Array.new(3, 4), digit_list(444))      
  end

  def test_v2
    expected = (1..5).to_a
    assert_equal(expected, digit_list_v2(12345))    
  end

  def test_v3
    expected = (1..5).to_a
    assert_equal(expected, digit_list_v3(12345))    
  end

  def test_v4
    expected = (1..5).to_a
    assert_equal(expected, digit_list_v4(12345))    
  end

  def test_v5
    expected = (1..5).to_a
    assert_equal(expected, digit_list_v5(12345))    
  end

end