=begin
FizzBuzz

Write a method that takes two arguments: the first is the starting number,
and the second is the ending number. Print out all numbers between the two
numbers, except if a number is divisible by 3, print "Fizz", if a number is
divisible by 5, print "Buzz", and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Example:

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SixthExercise < Minitest::Test

  def fizzbuzz(start_num, end_num)
    (start_num..end_num).to_a.map do |n|
      case
      when (n % (3*5)).zero? then "FizzBuzz"
      when (n % 3).zero? then "Fizz"
      when (n % 5).zero? then "Buzz"
      else n.to_s
      end
    end.join(", ")      
  end

  def test_1
    # skip
    expected = "1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz"
    result = fizzbuzz(1, 15)
    assert_equal(expected, result)
  end
  
end