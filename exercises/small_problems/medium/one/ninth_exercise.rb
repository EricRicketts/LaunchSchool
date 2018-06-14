require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Fibonacci Numbers (Procedural)
In the previous exercise, we developed a recursive solution to calculating the nth Fibonacci number.
In a language that is not optimized for recursion, some (not all) recursive methods can be extremely
slow and require massive quantities of memory and/or stack space.

Ruby does a reasonably good job of handling recursion, but it isn't designed for heavy recursion;
as a result, the Fibonacci solution is only useful up to about fibonacci(40). With higher values of nth,
the recursive solution is impractical. (Our tail recursive solution did much better, but even that failed at around fibonacci(8200).)

Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method.

Rewrite your recursive fibonacci method so that it computes its results without recursion.

Examples:

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

Fibonacci numbers
0 0
1 1
2 1
3 2
4 3
5 5
6 8
7 13
=end

class NinthExercise < Minitest::Test

  def fibonacci(n)
    return 0 if n.zero?
    return 1 if n < 3
    sum = 0
    fib_n_minus_1 = fib_n_minus_2 = 1
    3.upto(n) do
      sum = fib_n_minus_1 + fib_n_minus_2
      fib_n_minus_2 = fib_n_minus_1
      fib_n_minus_1 = sum
    end
    sum
  end

  def test_0
    # skip
    assert_equal(0, fibonacci(0))
  end

  def test_1
    # skip
    assert_equal(1, fibonacci(1))
  end
  
  def test_2
    # skip
    assert_equal(1, fibonacci(2))
  end
  
  def test_3
    # skip
    assert_equal(2, fibonacci(3))
  end
  
  def test_4
    # skip
    assert_equal(3, fibonacci(4))
  end
  
  def test_5
    # skip
    assert_equal(5, fibonacci(5))
  end
  
  def test_6
    # skip
    assert_equal(144, fibonacci(12))
  end
  
  def test_7
    # skip
    assert_equal(6765, fibonacci(20))
  end

  def test_8
    # skip
    assert_equal(354224848179261915075, fibonacci(100))
  end
  
end

class NinthExerciseLS < Minitest::Test
=begin
this is really elegant, my code captured the same
idea but they did it much more succinctly
=end

  def fibonacci(n)
    return 0 if n.zero?
    first, last = [1, 1]
    3.upto(n) do
      first, last = [last, first + last]
    end
    last
  end

  def test_0
    # skip
    assert_equal(0, fibonacci(0))
  end

  def test_1
    # skip
    assert_equal(1, fibonacci(1))
  end
  
  def test_2
    # skip
    assert_equal(1, fibonacci(2))
  end
  
  def test_3
    # skip
    assert_equal(2, fibonacci(3))
  end
  
  def test_4
    # skip
    assert_equal(3, fibonacci(4))
  end
  
  def test_5
    # skip
    assert_equal(5, fibonacci(5))
  end
  
  def test_6
    # skip
    assert_equal(144, fibonacci(12))
  end
  
  def test_7
    # skip
    assert_equal(6765, fibonacci(20))
  end

  def test_8
    # skip
    assert_equal(354224848179261915075, fibonacci(100))
  end
  
end  

