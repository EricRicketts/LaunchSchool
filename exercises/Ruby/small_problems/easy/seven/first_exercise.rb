require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise < Minitest::Test

=begin
Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a 
new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:

interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=end

  def interleave(arr1, arr2)
    arr1.zip(arr2).flatten
  end

  def test_1
    expected = [1, 'a', 2, 'b', 3, 'c']
    arr1, arr2 = (1..3).to_a, ('a'..'c').to_a
    assert_equal(expected, interleave(arr1, arr2))
  end

end

class FirstExerciseLS < Minitest::Test

  def interleave(arr1, arr2)
    result = []
    arr1.each.with_index {|e, idx| result.push(e, arr2[idx])}
    result
  end

  def test_1
    expected = [1, 'a', 2, 'b', 3, 'c']
    arr1, arr2 = (1..3).to_a, ('a'..'c').to_a
    assert_equal(expected, interleave(arr1, arr2))
  end
  
end

class FirstExerciseManual < Minitest::Test

=begin
  - key points arrays are non-empty & they have the same number
  of elements

  AL:
    - first array leads in the pairing, the second array follows
    - loop to last index
      - ary.push(arr1[idx], arr2[idx])
=end

  def interleave(arr1, arr2)
    ary = []
    last_index = arr1.length - 1
    0.upto(last_index) do |idx|
      ary.push(arr1[idx], arr2[idx])
    end
    ary
  end

  def test_1
    expected = [1, 'a', 2, 'b', 3, 'c']
    arr1, arr2 = (1..3).to_a, ('a'..'c').to_a
    assert_equal(expected, interleave(arr1, arr2))
  end  
  
end