require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits,
you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597. Finally,
keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

AL:
  - number of rotations will be 1 less than the number of digits
  - digits to be rotated work from front to back
  - start with full number of digits to be rotated
  - then subract one each time until you reach 2
    - new_rotated_number = rotated_rightmost_digits(number, num_of_digits)
    - number = rotated_number
=end

class ThirdExercise < Minitest::Test

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

  def max_rotation(number)
    n = number.digits.size
    n.downto(2) do |num_of_digits|
      number = rotate_rightmost_digits(number, num_of_digits)
    end 
    number   
  end

  def test_0
    # skip
    expected = 321579
    result = max_rotation(735291)
    assert_equal(expected, result)
  end

  def test_1
    # skip
    expected = 3
    result = max_rotation(3)
    assert_equal(expected, result)
  end

  def test_2
    # skip
    expected = 53
    result = max_rotation(35)
    assert_equal(expected, result)
  end

  def test_3
    # skip
    expected = 15
    result = max_rotation(105)
    assert_equal(expected, result)
  end

  def test_4
    # skip
    expected = 7_321_609_845
    result = max_rotation(8_703_529_146)
    assert_equal(expected, result)
  end

end