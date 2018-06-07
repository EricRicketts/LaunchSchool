require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly
the same as its right-side digits. For example, 44, 3333, 103103, 7676 are all double numbers.
444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument,
unless the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

AL:
  - if the number is not a double double or odd
    then return 2*number
  - find double double number
  - str = number.to_s
  - halfway = str.length/2 - 1
  - str[0..half] == str[half+1..-1]
=end

class ExerciseTwo < Minitest::Test

  def twice(num)
    str = num.to_s
    middle = (str.length/2) - 1
    (str.length.even? && str[0..middle] == str[middle+1..-1]) ? num : num*2
  end

  def test_0
    # skip
    assert_equal(74, twice(37))
  end
  
  def test_1
    # skip
    assert_equal(44, twice(44))
  end
  
  def test_2
    # skip
    assert_equal(668866, twice(334433))
  end
  
  def test_3
    # skip
    assert_equal(888, twice(444))
  end
  
  def test_4
    # skip
    assert_equal(214, twice(107))
  end
  
  def test_5
    # skip
    assert_equal(103103, twice(103103))
  end
  
  def test_6
    # skip
    assert_equal(3333, twice(3333))
  end
  
  def test_7
    # skip
    assert_equal(7676, twice(7676))
  end
  
  def test_8
    # skip
    assert_equal(123_456_789_123_456_789, twice(123_456_789_123_456_789))
  end
  
  def test_9
    # skip
    assert_equal(10, twice(5))
  end
  
end