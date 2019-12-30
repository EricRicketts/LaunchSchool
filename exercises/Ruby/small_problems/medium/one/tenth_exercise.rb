require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Fibonacci Numbers (Last Digit)
In the previous exercise, we developed a procedural method for computing the value of the nth Fibonacci numbers.
This method was really fast, computing the 20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit of the nth Fibonacci number.

Examples:

fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4
=end

class TenthExercise < Minitest::Test

  def fibonacci(n)
    return 0 if n.zero?
    first, last = [1, 1]
    3.upto(n) do
      first, last = [last, first + last]
    end
    last
  end

  def fibonacci_last(n)
    fibonacci(n).digits.first    
  end 

  def test_0
    # skip
    assert_equal(0, fibonacci_last(15))  
  end
 
  def test_1
    # skip
    assert_equal(5, fibonacci_last(20))  
  end
 
  def test_2
    # skip
    assert_equal(5, fibonacci_last(100))  
  end
 
  def test_3
    # skip
    assert_equal(1, fibonacci_last(100_001))  
  end
  
end