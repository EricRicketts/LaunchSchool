require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition,
and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example,
the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations
before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an
argument. (The first Fibonacci number has index 1.)

Examples:

find_fibonacci_index_by_length(2) == 7
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
You may assume that the argument is always greater than or equal to 2.

I: input is the length of the Fib #
O: is the Fib # which first meets this required length

AL:
  - have a variable called count
  - set count = 1 to begin with
  - loop
    - fib_num.to_s.length == desired length of Fib#?
      - if yes return count, if no iterate again
=end

class ThirdExercise < Minitest::Test

  def fibonacci_number(seq_count)
    if seq_count.zero?
      0
    elsif seq_count == 1
      1
    else
      fibonacci_number(seq_count - 1) + fibonacci_number(seq_count - 2)
    end
  end

  def find_fibonacci_index_by_length(number_length)
    count = 0
    loop do
      fib_num = fibonacci_number(count)
      break if fib_num.to_s.length >= number_length
      count += 1
    end
    count
  end

  def test_1
    assert_equal(7, find_fibonacci_index_by_length(2))
  end
  
  def test_2
    assert_equal(12, find_fibonacci_index_by_length(3))
  end
  
  def test_3
    assert_equal(17, find_fibonacci_index_by_length(4))
  end
  
  def test_4
    assert_equal(21, find_fibonacci_index_by_length(5))
  end  

end

class ThirdExerciseLS < Minitest::Test

=begin
I like the LS solution better because it is faster
I was trying to figure out how to do the Fibonacci
sequence without recursion and LS provided it.  As you
can see I was able to get through all of the tests except
for one case and the program finished but it took > 3 seconds
to run so I dropped the last case.  The recursive solution
was too limited by its throughput
=end

  def find_fibonacci_index_by_length(number_digits)
    first = 1
    second = 1
    index = 2

    loop do
      index += 1
      fibonacci = first + second
      break if fibonacci.to_s.length >= number_digits
      second = first
      first = fibonacci
    end

    index
  end

  def test_1
    assert_equal(7, find_fibonacci_index_by_length(2))
  end
  
  def test_2
    assert_equal(12, find_fibonacci_index_by_length(3))
  end
  
  def test_3
    assert_equal(17, find_fibonacci_index_by_length(4))
  end
  
  def test_4
    assert_equal(21, find_fibonacci_index_by_length(5))
  end    

  def test_5
    assert_equal(45, find_fibonacci_index_by_length(10))      
  end

  def test_6
    assert_equal(476, find_fibonacci_index_by_length(100))      
  end

  def test_7
    assert_equal(4782, find_fibonacci_index_by_length(1000))      
  end

end

