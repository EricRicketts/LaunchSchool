require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Multiply All Pairs

Write a method that takes two Array arguments in which each Array contains
a list of numbers, and returns a new Array that contains the product of
every pair of numbers that can be formed between the elements of the two
Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

AL:
  Manual
    - create an empty array
    - loop through the outer array
      - loop through the inner array
      - emtpy array << outer number * inner number
    - sort the resulting array
=end

class ExerciseNine < Minitest::Test

  def multiply_all_pairs(arr1, arr2)
    result = []
    arr1.each do |num1|
      arr2.each do |num2|
        result << num1*num2
      end
    end
    result.sort
  end

  def test_0
    # skip
    expected = [2, 4, 4, 6, 8, 8, 12, 16]
    result = multiply_all_pairs([2, 4], [4, 3, 1, 2])
    assert_equal(expected, result)
  end
  
end

class ExerciseNineAlternateSolution < Minitest::Test

  def multiply_all_pairs(arr1, arr2)
    arr1.product(arr2).map {|(num1, num2)| num1*num2}.sort    
  end

  def test_0
    # skip
    expected = [2, 4, 4, 6, 8, 8, 12, 16]
    result = multiply_all_pairs([2, 4], [4, 3, 1, 2])
    assert_equal(expected, result)
  end
  
end