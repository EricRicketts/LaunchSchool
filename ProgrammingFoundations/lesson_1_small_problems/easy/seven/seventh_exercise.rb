=begin
Multiplicative Average

Write a method that takes an Array of integers as input, multiplies all the numbers together,
divides the result by the number of entries in the Array, and then prints the result rounded
to 3 decimal places. Assume the array is non-empty.

Examples:

show_multiplicative_average([3, 5])
The result is 7.500

show_multiplicative_average([6])
The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
The result is 28361.667
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

  def show_multiplicative_average(ary)
    (ary.inject(&:*) / ary.length.to_f).round(3)
  end

  def test_1
    # skip
    expected = 7.500
    result = show_multiplicative_average([3, 5])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 6.000
    result = show_multiplicative_average([6])
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 28361.667
    result = show_multiplicative_average([2, 5, 7, 11, 13, 17])
    assert_equal(expected, result)
  end
  
end

class SeventhExerciseManual < Minitest::Test

  def show_multiplicative_average(ary)
    product = 1
    ary.each do |num|
      product *= num
    end
    (product / ary.length.to_f).round(3)
  end

  def test_1
    # skip
    expected = 7.500
    result = show_multiplicative_average([3, 5])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 6.000
    result = show_multiplicative_average([6])
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 28361.667
    result = show_multiplicative_average([2, 5, 7, 11, 13, 17])
    assert_equal(expected, result)
  end
  
end