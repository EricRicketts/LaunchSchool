require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of the array.
The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true

Input: an array of elements could be strings or numbers
Output: rotated array where the first element of the array
goes to the last element of the array and all other element shift left
Key point: original array is left untouched, return a new array

Algoritm:
  - say we have a five element array
  - [1, 2, 3, 4, 5] indices are [0, 1, 2, 3, 4]
  - new array [2, 3, 4, 5, 1]
  - indices change
    - 1 : rot_ary[0] => ary[1]
    - 2 : rot_ary[1] => ary[2]
    - 3 : rot_ary[2] => ary[3]
    - 4 : rot_ary[3] => ary[4]
    - 5 : rot_ary[4] => ary[0]
    - so add 1 to index and take that value
    - if index = 4 then take 0 index from original array

  - another way
    - (index + 1) % 5 or (index + 1) % array_length
    - why does this work?  Because there are 5 elements in the array
    but we need to handle not indices 1..5 but 0..4 so (x + y) where
    0 <= x <= 4 and y is 1.  Thus x + y <= 5.  This works because if we
    are at index 4 of the original array, the new array needs index 0
    and (4 + 1) % 5 = 0
=end

class FirstExercise < Minitest::Test

  def rotate_array(ary)
    ary_size = ary.size
    last_idx = ary_size - 1
    new_ary = []
    0.upto(last_idx) do |idx|
      shifted_idx = (idx + 1) % ary_size
      new_ary[idx] = ary[shifted_idx]
    end
    new_ary
  end

  def test_one
    assert_equal([3, 5, 2, 9, 1, 7], rotate_array([7, 3, 5, 2, 9, 1]))
  end
  
  def test_two
    assert_equal(['b', 'c', 'a'], rotate_array(['a', 'b', 'c']))
  end
  
  def test_three
    assert_equal(['a'], rotate_array(['a']))
  end
  
  def test_four
    x = (1..4).to_a
    y = rotate_array(x)
    assert_equal([1, 2, 3, 4], x)
  end
  
end

class FirstExerciseInstructorSolution < Minitest::Test

=begin
this only comes from working a lot of problems and reading
other solutions.  I had though of slicing but only in context
of doing a loop.  This is so much better.  I might have had a
better chance of seeing such a soluiton if I had made more
carfule obsevations, see below
take the original array:
[1, 2, 3, 4, 5] rotated array:
[2, 3, 4, 5, 1]

0  1  2  3  4 => index
______________
1  2  3  4  5 => original
2  3  4  5  1 => rotated

we can see that the new array
is the same as the old array but we
start the new array index 0 at index 1
of the current array and then just add
the first element to the back of the array
=end

  def rotate_array(ary)
    ary[1..-1] + [ary[0]]
  end

  def test_one
    assert_equal([3, 5, 2, 9, 1, 7], rotate_array([7, 3, 5, 2, 9, 1]))
  end
  
  def test_two
    assert_equal(['b', 'c', 'a'], rotate_array(['a', 'b', 'c']))
  end
  
  def test_three
    assert_equal(['a'], rotate_array(['a']))
  end
  
  def test_four
    x = (1..4).to_a
    y = rotate_array(x)
    assert_equal([1, 2, 3, 4], x)
  end
  
end


class FirstExerciseFurtherExploration < Minitest::Test

  def setup
    @arr = [0, 1, 2, 3, 4, 5, 6]
  end

  def rotate_array(arr, iterations: 1, direction: "left")
    direction = "right" unless direction == "left"
    iterations = -1*iterations if direction == "right"
    size = arr.size
    last_idx = size - 1
    rotated_arr = []

    arr.each_index do |idx|
      new_idx = (idx + iterations) % size
      rotated_arr.push(arr[new_idx])
    end
    rotated_arr    
  end

  def test_1_rotation_left
    # skip
    expected = [1, 2, 3, 4, 5, 6, 0]
    result = rotate_array(@arr)
    assert_equal(expected, result)
  end

  def test_1_rotation_right
    # skip
    expected = [6, 0, 1, 2, 3, 4, 5]
    result = rotate_array(@arr, direction: "right")
    assert_equal(expected, result)
  end
  
  def test_3_rotations_left
    # skip
    expected = [3, 4, 5, 6, 0, 1, 2]
    result = rotate_array(@arr, iterations: 3)
    assert_equal(expected, result)
  end

  def test_4_rotations_right
    # skip
    expected = [0, 1, 2, 3, 4, 5, 6]
    expected = [3, 4, 5, 6, 0, 1, 2]
    result = rotate_array(@arr, iterations: 4, direction: "right")
    assert_equal(expected, result)
  end
  
end

class FirstExerciseFurtherExploration < Minitest::Test

  def setup
    @arr = [0, 1, 2, 3, 4, 5, 6]
  end

  def rotate_array(arr, iterations: 1, direction: "left")
    if direction != "left"
      (arr[-iterations..-1] + arr[0..(-iterations-1)]).flatten
    else
      (arr[iterations..-1] + arr[0..(iterations-1)]).flatten
    end
  end

  def test_1_rotation_left
    # skip
    expected = [1, 2, 3, 4, 5, 6, 0]
    result = rotate_array(@arr)
    assert_equal(expected, result)
  end

  def test_1_rotation_right
    # skip
    expected = [6, 0, 1, 2, 3, 4, 5]
    result = rotate_array(@arr, direction: "right")
    assert_equal(expected, result)
  end
  
  def test_3_rotations_left
    # skip
    expected = [3, 4, 5, 6, 0, 1, 2]
    result = rotate_array(@arr, iterations: 3)
    assert_equal(expected, result)
  end

  def test_4_rotations_right
    # skip
    expected = [0, 1, 2, 3, 4, 5, 6]
    expected = [3, 4, 5, 6, 0, 1, 2]
    result = rotate_array(@arr, iterations: 4, direction: "right")
    assert_equal(expected, result)
  end
  
end

