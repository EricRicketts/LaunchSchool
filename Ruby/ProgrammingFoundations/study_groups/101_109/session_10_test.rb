require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

# implement a function that calculates the sum of the integers inside a string.
# For example, in the string "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog",
# the sum of the integers is 3635.

# Note: only positive integers will be tested.

=begin
AL:
  - select from the string all digits which are grouped together
  - perfect use of scan function
  - as you select them covnert to integer with :to_i
  - then sum up the numbers

=end

class Session10TestProblemOne < Minitest::Test

  def sum_of_integers(str)
    str.scan(/[[:digit:]]+/).map(&:to_i).sum
  end

  def test_0
    expected = 3635
    str = "The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"
    result = sum_of_integers(str)
    assert_equal(expected, result)
  end

end
# Positive integers that are divisible exactly by the sum of their digits are called Harshad numbers. The first few Harshad numbers are: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 12, 18, ...

# We are interested in Harshad numbers where the product of its digit sum s and s with the digits reversed, gives the original number n. For example consider number 1729:

# its digit sum, s = 1 + 7 + 2 + 9 = 19
# reversing s = 91
# and 19 * 91 = 1729 --> the number that we started with.
# Complete the function which tests if a positive integer n is Harshad number, and returns True if the product of its digit sum and its digit sum reversed equals n; otherwise return False.



# p number_joy(1997) == false
# p number_joy(1998) == false
# p number_joy(1729) == true
# p number_joy(18)   == false
# p number_joy(81)   ==  true
# p number_joy(1458) ==  true

class Session10TestProblemTwo < Minitest::Test
  
  def number_joy(number)
    sum_of_digits = number.digits.sum
    reversed_sum = sum_of_digits.digits.join.to_i

    sum_of_digits * reversed_sum == number
  end

  def test_0
    # skip
    refute(number_joy(1997))
  end

  def test_1
    # skip
    refute(number_joy(1997))
  end

  def test_2
    # skip
    assert(number_joy(1729))
  end

  def test_3
    # skip
    refute(number_joy(18))
  end

  def test_4
    # skip
    assert(number_joy(81))
  end

  def test_5
    # skip
    assert(number_joy(1458))
  end

end

=begin
odd_but_not_prime(n)
returns all numbers between 1 and n inclusive which are odd but not prime
limited to numbers between 1 and 1000
=end

class Session10TestProblemThree < Minitest::Test

  def prime?(num)
    (1..num).none? {|n| n != 1 && n != num && (num % n).zero?}
  end

  def odd_but_not_prime(x)
    (1..x).select {|n| n.odd? && !prime?(n)}.count
  end

  def test_0
    # skip
    assert_equal(1, odd_but_not_prime(10))
  end
  
  def test_1
    # skip
    assert_equal(2, odd_but_not_prime(20))
  end
  
  def test_2
    # skip
    assert_equal(10, odd_but_not_prime(50))
  end
  
  def test_3
    # skip
    assert_equal(25, odd_but_not_prime(100))
  end
  
  def test_4
    # skip
    assert_equal(88, odd_but_not_prime(300))
  end
  
end

=begin
# Given a string made of digits [0-9], return a string where each digit is repeated a number of times equals to its value.

I:string
O:string
F

p digits_explode("312") == "333122"
p digits_explode("102269") == "12222666666999999999"
=end

class Session10TestProblemFour < Minitest::Test

  def digits_explode(str)
    str.chars.inject('') {|new_str, char| new_str += char*char.to_i}
  end

  def test_0
    # skip
    assert_equal("333122", digits_explode("312"))
  end
  
  def test_1
    # skip
    assert_equal("12222666666999999999", digits_explode("102269"))
  end
  
end