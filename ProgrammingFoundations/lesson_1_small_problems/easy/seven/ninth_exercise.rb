=begin
Multiply All Pairs

Write a method that takes two Array arguments in which each Array contains a list of numbers,
and returns a new Array that contains the product of every pair of numbers that can be formed
between the elements of the two Arrays. The results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Examples:

multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

I: 2 arrays
O: 1 array

AL
  - create new empty array
  - outer loop iterate through all of the elements in the first array
  - inner loop interate through all of the elements in the second array
    - in the inner loop push onto new array outer element * inner element
  - when both loops finish sort and return the new array
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class NinthExercise < Minitest::Test

  def multiply_all_pairs(arr1, arr2)
    result = []
    arr1.each do |e1|
      arr2.each do |e2|
        result.push(e1*e2)
      end
    end
    result.sort
  end

  def test_1
    # skip
    expected = [2, 4, 4, 6, 8, 8, 12, 16]
    result = multiply_all_pairs([2, 4], [4, 3, 1, 2])
    assert_equal(expected, result)
  end
  
end

class NinthExerciseAltSol < Minitest::Test

  def multiply_all_pairs(arr1, arr2)
    arr1.map do |e1|
      arr2.map do |e2|
        e1*e2
      end
    end.flatten.sort
  end

  def test_1
    # skip
    expected = [2, 4, 4, 6, 8, 8, 12, 16]
    result = multiply_all_pairs([2, 4], [4, 3, 1, 2])
    assert_equal(expected, result)
  end
  
end

class NinthExerciseLS < Minitest::Test
=begin
I did not look hard enough for some other
array methods
=end
  def multiply_all_pairs(arr1, arr2)
    arr1.product(arr2).map {|e1, e2| e1*e2}.sort
  end

  def test_1
    # skip
    expected = [2, 4, 4, 6, 8, 8, 12, 16]
    result = multiply_all_pairs([2, 4], [4, 3, 1, 2])
    assert_equal(expected, result)
  end
  
end

