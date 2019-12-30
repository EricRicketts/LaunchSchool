require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FifthExercise < Minitest::Test

=begin
Multiples of 3 and 5

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number,
and then computes the sum of those multiples. For instance, if the supplied number is 20,
the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

Input: A number > 1
Output: A number

Algorithm:
  - (1..num).reduce
  - if (n % 3).zero? OR (n % 5).zero? then add the number to the total
Examples

multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

=end

  def multisum(num)
    (1..num).reduce(0) {|sum, n| sum += (((n % 3).zero? || (n % 5).zero?) ? n : 0)}
  end

  def test_one
    assert_equal(3, multisum(3))
  end
  
  def test_two
    assert_equal(8, multisum(5))
  end
  
  def test_three
    assert_equal(33, multisum(10))
  end
  
  def test_four
    assert_equal(234168, multisum(1000))
  end
  
end

class FifthExerciseManual < Minitest::Test
=begin
AL:
  - make an array (1..num).to_a
  - make an emtpy array, valid_numbers
  - iterate through the array
    - if the number is a multiple of 3 or 5
      add it to the valid array
  - return valid_array.sum
=end

  def multisum(num)
    num_arr = (1..num).to_a
    valid_arr = []
    num_arr.each do |number|
      valid_arr.push(number) if (number % 3).zero? || (number % 5).zero?
    end
    valid_arr.sum   
  end

   def test_one
    assert_equal(3, multisum(3))
  end
  
  def test_two
    assert_equal(8, multisum(5))
  end
  
  def test_three
    assert_equal(33, multisum(10))
  end
  
  def test_four
    assert_equal(234168, multisum(1000))
  end 
  
end

class FifthExerciseLS < Minitest::Test
=begin
I like the LS solution with the #multiple?, very nice
and general purpose.  Also my solution is a bit repetative
as going straight to the sum is more efficient.
=end

  def multiple?(number, divisor)
    number % divisor == 0
  end

  def multisum(max_value)
    sum = 0
    1.upto(max_value) do |number|
      if multiple?(number, 3) || multiple?(number, 5)
        sum += number
      end
    end
    sum
  end

   def test_one
    assert_equal(3, multisum(3))
  end
  
  def test_two
    assert_equal(8, multisum(5))
  end
  
  def test_three
    assert_equal(33, multisum(10))
  end
  
  def test_four
    assert_equal(234168, multisum(1000))
  end 
  
  
end