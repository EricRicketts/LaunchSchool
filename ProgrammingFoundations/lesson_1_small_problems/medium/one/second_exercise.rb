require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Rotation (Part 2)

Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

AL:
  - creat an array of chars
  - partiion the array according to the number of digits to rotate
  - rotate the desired digits which return a new array
  - combine the untouched array and the rotated array to form a new array
=end

class SecondExercise < Minitest::Test

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

  def rotate_rightmost_digits(arr, num_of_digits)
    arr = arr.to_s.chars
    dividing_idx = arr.size - num_of_digits
    untouched, slice = arr.partition.with_index {|_, idx| idx < dividing_idx}
    rotated_slice = rotate_array(slice)
    (untouched + rotated_slice).join.to_i
  end

  def test_1
    # skip
    expected = 735291
    result = rotate_rightmost_digits(735291, 1)
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 735219
    result = rotate_rightmost_digits(735291, 2)
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 735912
    result = rotate_rightmost_digits(735291, 3)
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 732915
    result = rotate_rightmost_digits(735291, 4)
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = 752913
    result = rotate_rightmost_digits(735291, 5)
    assert_equal(expected, result)
  end
  
  def test_6
    # skip
    expected = 352917
    result = rotate_rightmost_digits(735291, 6)
    assert_equal(expected, result)
  end
  
end

class SecondExerciseLS < Minitest::Test

  def rotate_array(arr)
     arr[1..-1] + [arr[0]]
  end

  def rotate_rightmost_digits(number, n)
    all_digits = number.to_s.chars
    all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
    all_digits.join.to_i
  end

  def test_1
    # skip
    expected = 735291
    result = rotate_rightmost_digits(735291, 1)
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = 735219
    result = rotate_rightmost_digits(735291, 2)
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = 735912
    result = rotate_rightmost_digits(735291, 3)
    assert_equal(expected, result)
  end
  
  def test_4
    # skip
    expected = 732915
    result = rotate_rightmost_digits(735291, 4)
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = 752913
    result = rotate_rightmost_digits(735291, 5)
    assert_equal(expected, result)
  end
  
  def test_6
    # skip
    expected = 352917
    result = rotate_rightmost_digits(735291, 6)
    assert_equal(expected, result)
  end
  
end