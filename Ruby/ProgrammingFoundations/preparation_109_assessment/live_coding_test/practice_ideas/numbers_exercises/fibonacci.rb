require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
AL:
  - general algorithm is the current number is the sum of the last two numbers
  - define some fixed responses
    - n = 0 return 0
    - n = 1 return 1


=end

class FibonacciFirstSolution < Minitest::Test

  def fibonacci(n)
    return 0 if n.zero?
    return 1 if n == 1
    fib_number = (2..n.abs).inject([0, 1]) do |sum, idx|
      sum << sum[idx - 1] + sum[idx - 2]
    end.last
    n < 0 ? (-1)**(n.abs+1)*fib_number : fib_number
  end

  def test_1
    # skip
    assert_equal(0, fibonacci(0))
  end

  def test_2
    # skip
    assert_equal(1, fibonacci(1))
  end

  def test_3
    # skip
    assert_equal(1, fibonacci(2))
  end

  def test_4
    # skip
    assert_equal(1, fibonacci(-1))
  end

  def test_5
    # skip
    assert_equal(-1, fibonacci(-2))
  end

  def test_5
    # skip
    assert_equal(2, fibonacci(3))
  end

  def test_6
    # skip
    assert_equal(2, fibonacci(-3))
  end

  def test_7
    # skip
    assert_equal(21, fibonacci(8))
  end

  def test_8
    # skip
    assert_equal(-21, fibonacci(-8))
  end

  def test_9
    # skip
    assert_equal(34, fibonacci(9))
  end

  def test_10
    # skip
    assert_equal(34, fibonacci(-9))
  end

end