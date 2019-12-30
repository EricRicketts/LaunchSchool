require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
# 109 study group

# Write a method that computes the difference between the square of the sum of
# the first n positive integers and the sum of the squares of the first n positive
# integers.

# Examples:





p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150


=end

class Session13TestFirstProblem < Minitest::Test

  def sum_square_difference(num)
    arr = (1..num).to_a
    square_of_sum = arr.inject(0, &:+).pow(2)
    sum_of_squares = arr.inject(0) {|sum, num| sum += num.pow(2)}
    square_of_sum - sum_of_squares
  end

  def test_1
    # skip
    assert_equal(22, sum_square_difference(3))
  end
  
  def test_2
    # skip
    assert_equal(2640, sum_square_difference(10))
  end
  
  def test_3
    # skip
    assert_equal(0, sum_square_difference(1))
  end
  
  def test_4
    # skip
    assert_equal(25164150, sum_square_difference(100))
  end
  
end

class Session13TestSecondProblem < Minitest::Test

=begin
# Create a method that takes two integers as arguments. The first argument is
# a count, and the second is the first number of a sequence that your method
# will create. The method should return an Array that contains the same number
# of elements as the count argument, while the values of each element will be
# multiples of the starting number.

# You may assume that the count argument will always have a value of 0 or
# greater, while the starting number can be any integer value.
# If the count is 0, an empty list should be returned.

p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
AL:
  - first number is range of array
  - second number is the increment
  - do a map
    number*increment
=end

  def sequence(limit, incr)
    (1..limit).map {|num| num*incr}
  end

  def test_1
    # skip
    assert_equal([1, 2, 3, 4, 5], sequence(5, 1))
  end
  
  def test_2
    # skip
    assert_equal([-7, -14, -21, -28], sequence(4, -7))
  end
  
  def test_3
    # skip
    assert_equal([0, 0, 0], sequence(3, 0))
  end
  
  def test_4
    # skip
    assert_equal([], sequence(0, 1000000))
  end
  
end

class Session13TestThirdProblem < Minitest::Test

=begin
# Positive integers that are divisible exactly by the sum of their digits are called Harshad numbers. The first few Harshad numbers are: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 18, ...

# We are interested in Harshad numbers where the product of its digit sum s and s with the digits reversed, gives the original number n. For example consider number 1729:

# its digit sum, s = 1 + 7 + 2 + 9 = 19
# reversing s = 91
# and 19 * 91 = 1729 --> the number that we started with.
# Complete the function which tests if a positive integer n is Harshad number, and returns True if the product of its digit sum and its digit sum reversed equals n; otherwise return False.

p number_joy(1997) == false
p number_joy(1998) == false
p number_joy(1729) == true
p number_joy(18)   == false
p number_joy(81)   ==  true
p number_joy(1458) ==  true

AL:
  - if not an Harshad number then false, this is implied in the problem statement
  - if is an Harshad number then convert sum to string
  - reverse the string
  - change both to int
  - product * product_reverse == original number
=end

  def number_joy(num)
    sum = num.digits.sum
    return false unless (num % sum).zero?
    sum * sum.to_s.reverse.to_i == num
  end

  def test_1
    # skip
    refute(number_joy(1997))
  end
  
  def test_2
    # skip
    refute(number_joy(1998))
  end
  
  def test_3
    # skip
    assert(number_joy(1729))
  end
  
  def test_4
    # skip
    refute(number_joy(18))
  end
  
  def test_5
    # skip
    assert(number_joy(81))
  end
  
  def test_6
    # skip
    assert(number_joy(1458))
  end
  
end

class Session13TestFourthProblem < Minitest::Test

=begin
# Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2.
In the alphabet, a and b are also in positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

# Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example, solve(["abode","ABc","xyzD"]) == [4,3,1].

# Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

p solve(["abode","ABc","xyzD"]) == [4,3,1]

=end

  LETTER_POSITION = ('a'..'z').zip(0..25).to_h

  def solve(arr)
    arr.map do |word|
      word.chars.each.with_index.inject(0) do |sum, (letter, idx)|
        lowercase = letter.downcase
        sum += 1 if idx == LETTER_POSITION[lowercase]
        sum
      end
    end    
  end

  def test_1
    assert_equal([4, 3, 1], solve(["abode","ABc","xyzD"]))
  end
  
end

class Session13TestFifthProblem < Minitest::Test

=begin
# return the count of pairs that have consecutive numbers as follows:

# For array [1,2,5,8,-4,-3,7,6,5]

# The pairs are selected as follows [(1,2),(5,8),(-4,-3),(7,6),5]
# --the first pair is (1,2) and the numbers in the pair are consecutive; Count = 1
# --the second pair is (5,8) and are not consecutive
# --the third pair is (-4,-3), consecutive. Count = 2
# --the fourth pair is (7,6), also consecutive. Count = 3.
# --the last digit has no pair, so we ignore.

p pairs([1,2,5,8,-4,-3,7,6,5]) == 3
AL:
  - divide the array into pairs of two numbers
  - sum where each pair are determine consecutive numbers
  - consecutive numbers
    - (3, 4)
    - (4, 3)
    - (-3, -4)
    - (-4, -3)
    - (abs.first - abs.last).abs == 1
=end
  def consecutive_numbers?(arr)
    (arr.first - arr.last).abs == 1     
  end 

  def pairs(arr)
    arr.each_slice(2).inject(0) do |sum, ary|
      consecutive_numbers?(ary) ? (sum += 1) : sum
    end
  end

  def test_1
    assert_equal(3, pairs([1,2,5,8,-4,-3,7,6,5]))
  end

end

class Session13TestFifthProblemManual < Minitest::Test

=begin
# return the count of pairs that have consecutive numbers as follows:

# For array [1,2,5,8,-4,-3,7,6,5]

# The pairs are selected as follows [(1,2),(5,8),(-4,-3),(7,6),5]
# --the first pair is (1,2) and the numbers in the pair are consecutive; Count = 1
# --the second pair is (5,8) and are not consecutive
# --the third pair is (-4,-3), consecutive. Count = 2
# --the fourth pair is (7,6), also consecutive. Count = 3.
# --the last digit has no pair, so we ignore.

p pairs([1,2,5,8,-4,-3,7,6,5]) == 3
AL:
  - divide the array into pairs of two numbers
  - sum where each pair are determine consecutive numbers
  - consecutive numbers
    - (3, 4)
    - (4, 3)
    - (-3, -4)
    - (-4, -3)
    - (abs.first - abs.last).abs == 1
=end
  def consecutive_numbers?(arr)
    (arr.first - arr.last).abs == 1     
  end 

  def pairs(arr)
    arr.pop if arr.size.odd?
    pair_of_numbers = (0..arr.size-1).step(2).map do |idx|
      [arr[idx], arr[idx+1]]
    end
    pair_of_numbers.inject(0) {|sum, ary| consecutive_numbers?(ary) ? (sum += 1) : sum}
  end

  def test_1
    assert_equal(3, pairs([1,2,5,8,-4,-3,7,6,5]))
  end

end