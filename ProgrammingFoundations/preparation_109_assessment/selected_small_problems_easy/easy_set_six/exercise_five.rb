require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Write a method that takes an Array, and returns a new Array
with the elements of the original list in reverse order.
Do not modify the original list.

You may not use Array#reverse or Array#reverse!,
nor may you use the method you wrote in the previous exercise.

Examples:

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b c d e)) == %w(e d c b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 2, 3]                      # => [1, 2, 3]
new_list = reverse(list)              # => [3, 2, 1]
list.object_id != new_list.object_id  # => true
list == [1, 2, 3]                     # => true
new_list == [3, 2, 1]                 # => true

AL:
  - make an empty array
  - get current array length
  - -1.downto(-array_length)
    empty_array.push(current array index)
  - return new array
=end

class ExerciseFive < Minitest::Test

  def reverse(arr)
    new_arr = []
    -1.downto(-arr.length) do |idx|
      new_arr.push(arr[idx])
    end
    new_arr
  end

  def test_0
    # skip
    expected = [4, 3, 2, 1]
    result = reverse([1, 2, 3, 4])
    assert_equal(expected, result)
    refute_equal(expected.object_id, result.object_id)
  end

  def test_1
    # skip
    assert_equal(%w(e d c b a), reverse(%w(a b c d e)))
  end

  def test_2
    # skip
    assert_equal(['abc'], reverse(['abc']))
  end

  def test_3
    # skip
    assert_equal([], reverse([]))
  end

end