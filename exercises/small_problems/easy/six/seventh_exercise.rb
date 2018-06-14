require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SeventhExercise < Minitest::Test

=begin
Halvsies

Write a method that takes an Array as an argument, and returns two Arrays that contain
the first half and second half of the original Array, respectively. If the original array
contains an odd number of elements, the middle element should be placed in the first half Array.

Examples:

halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

AL:
  - even array [1, 2, 3, 4]
    - select if idx < array.length/2
  - odd array [1, 2, 3, 4, 5]
    - select if idx <= array.length/2

=end

  def halvsies(ary)
    middle_index = ary.length.even? ? ary.length/2 : (ary.length/2) + 1
    ary.partition.with_index {|elem, idx| idx < middle_index}
  end

  def test_1
    # skip
    expected = [[1, 2], [3, 4]]
    result = halvsies([1, 2, 3, 4])
    assert_equal(expected, result)
  end

  def test_2
    # skip
    expected = [[1, 5, 2], [4, 3]]
    result = halvsies([1, 5, 2, 4, 3])
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = [[5], []]
    result = halvsies([5])
    assert_equal(expected, result)
  end

  def test_4
    # skip
    expected = [[], []]
    result = halvsies([])
    assert_equal(expected, result)
  end

end

class SeventhExerciseLS < Minitest::Test

=begin
I really like how LS used the #ceil method to divide
the arrays in half depending on whether they are even
or odd in lenghth.  I could have used this as the first
line in my code middle_index = (array.size/2.0).ceil the
decimal 2.0 is used to round up for odd arrays:
examples:
arr1 = [1, 2, 3, 4, 5, 6]; array.size = 6; 6/2.0 = 3.0.ceil = 3
which is perfect for the partition idx < middle_index

arr2 = [1, 2, 3, 4, 5, 6, 7]; array.size = 7; 7/2.0 = (3.5).ceil = 4
again perfect for the partition idx > middle_index
=end

  def halvsies(array)
    first_half = array.slice(0, (array.size / 2.0).ceil)
    second_half = array.slice(first_half.size, array.size - first_half.size)
    [first_half, second_half]
  end

  def test_1
    # skip
    expected = [[1, 2], [3, 4]]
    result = halvsies([1, 2, 3, 4])
    assert_equal(expected, result)
  end

  def test_2
    # skip
    expected = [[1, 5, 2], [4, 3]]
    result = halvsies([1, 5, 2, 4, 3])
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = [[5], []]
    result = halvsies([5])
    assert_equal(expected, result)
  end

  def test_4
    # skip
    expected = [[], []]
    result = halvsies([])
    assert_equal(expected, result)
  end  
  
end