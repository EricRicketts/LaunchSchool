require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

=begin
Reversed Arrays (Part 1)

Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:

list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b c d e)
reverse!(list) # => ["e", "d", "c", "b", "a"]
list == ["e", "d", "c", "b", "a"]

list = ['abc']
reverse!(list) # => ["abc"]
list == ["abc"]

list = []
reverse!(list) # => []
list == []

AL:
  - one list [1, 2, 3, 4]
  - reversed [4, 3, 2, 1]
  - another list [1, 2, 3, 4, 5]
  - reverse list [5, 4, 3, 2, 1]

  - if the list is even I loop through half indices or 0..(length/2) - 1
    - so if array is length 4 then length/2 = 2 and 2 - 1 = 1
  - if the array is odd, then I loop through half the indices 0..(length/2)
    - so if the array is length 5 then length/2 = 5/2 = 2
  - once I decide on the last index I need to swap
    - temp = ary[-(i+1)]
    - ary[-(i+1)] = ary[i]
    - ary[i] = temp

=end

  def reverse!(ary)
    halfway_index = ary.length.even? ? (ary.length/2) - 1 : ary.length/2
    0.upto(halfway_index) do |idx|
      temp = ary[-(idx+1)]
      ary[-(idx+1)] = ary[idx]
      ary[idx] = temp
    end
    ary        
  end

  def test_1
    list = (1..4).to_a
    result = reverse!(list)
    expected = [4, 3, 2, 1]
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
  def test_2
    list = %w(a b c d e)
    result = reverse!(list)
    expected = %w(e d c b a)
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
  def test_3
    list = ['abc']
    result = reverse!(list)
    expected = ['abc']
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
  def test_4
    list = []
    result = reverse!(list)
    expected = []
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
end

class FourthExerciseLS < Minitest::Test

=begin
this is a much better solution than the one I came up with
the variable swapping makes us of Ruby's multiple assignment
property.  The declaration of the left_index and right_index
reveal the intent much more clearly
=end

  def reverse!(array)
    left_index = 0
    right_index = -1

    while left_index < array.size / 2
      array[left_index], array[right_index] = array[right_index], array[left_index]
      left_index += 1
      right_index -= 1
    end

    array
  end

  def test_1
    list = (1..4).to_a
    result = reverse!(list)
    expected = [4, 3, 2, 1]
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
  def test_2
    list = %w(a b c d e)
    result = reverse!(list)
    expected = %w(e d c b a)
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
  def test_3
    list = ['abc']
    result = reverse!(list)
    expected = ['abc']
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
  
  def test_4
    list = []
    result = reverse!(list)
    expected = []
    assert_equal(expected, result)
    assert_equal(list.object_id, result.object_id)
  end
    
end