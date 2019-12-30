# Create a method that takes two integers as arguments. The first argument is
# a count, and the second is the first number of a sequence that your method
# will create. The method should return an Array that contains the same number
# of elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value.
# If the count is 0, an empty list should be returned.

# sequence(5, 1) == [1, 2, 3, 4, 5]
# sequence(4, -7) == [-7, -14, -21, -28]
# sequence(3, 0) == [0, 0, 0]
# sequence(0, 1000000) == []

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Session4Test < Minitest::Test

  def sequence(iteration_number, multiple)
    ary = []
    1.upto(iteration_number) do |n|
      ary.push(n*multiple)
    end
    ary
  end

  def test_1
    assert_equal((1..5).to_a, sequence(5, 1))
  end

  def test_2
    assert_equal([-7, -14, -21, -28], sequence(4, -7))
  end

  def test_3
    assert_equal([0, 0, 0], sequence(3, 0))
  end

  def test_4
    assert_equal([], sequence(0, 1000000))
  end

end

# Write a method that takes an Array of numbers and then returns the sum of
# the sums of each leading subsequence for that Array. You may assume that the
# Array always contains at least one number.

# p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
# p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
# p sum_of_sums([4]) == 4
# p sum_of_sums([1, 2, 3, 4, 5]) == 35

=begin
AL:
  - reduce sub arrays
    - use the index to sum the first number
=end

class Session4Test2nd < Minitest::Test


  def sum_of_sums(ary)
    ary.each.with_index.inject(0) {|sum, (n, idx)| sum += ary[0..idx].sum }
  end

  def test_1
    assert_equal(21, sum_of_sums([3, 5, 2]))
  end
  
  def test_2
    assert_equal(36, sum_of_sums([1, 5, 7, 3]))
  end
  
  def test_3
    assert_equal(4, sum_of_sums([4]))
  end
  
  def test_4
    assert_equal(35, sum_of_sums((1..5).to_a))
  end
  
end

# Given a string made of digits [0-9], return a string where each digit is repeated a number of times equals to its value.

# p digits_explode("312") = "333122"
# p digits_explode("102269") = "12222666666999999999"

class Session4Test3rd < Minitest::Test

  def digits_explode(str)
    str.chars.inject('') {|new_str, char| new_str += char*char.to_i}    
  end

  def test_1
    assert_equal("333122", digits_explode("312"))
  end

  def test_2
    assert_equal("12222666666999999999", digits_explode("102269"))
  end
  
end