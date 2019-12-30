require 'minitest/autorun'
require 'minitest/pride'

# Alyssa asked Ben to write up a basic implementation of a Fibonacci calculator,
#A user passes in two numbers, and the calculator will keep computing the sequence until some limit is reached.

# Ben coded up this implementation but complained that as soon as he ran it,
# he got an error. Something about the limit variable. What's wrong with the code?

# the problem with the code is that methods create their own scope block and they canot
# access local variables declared outside of the block in order to access a local variable
# it must be passed to the method as an argument

class QuestionSeven < Minitest::Test
  def test_fibonacci_error
    limit = 15

    def fib(first_num, second_num)
      while second_num < limit
        sum = first_num + second_num
        first_num = second_num
        second_num = sum
      end
      sum
    end
    err = assert_raises NameError do
      fib(0, 1)
    end
    assert_match /undefined local variable or method `limit'/, err.message
  end

  def test_fibonacci_correction
    limit = 15

    def fib(first_num, second_num, limit)
      while second_num < limit
        sum = first_num + second_num
        first_num = second_num
        second_num = sum
      end
      sum
    end
    assert_equal 21, fib(0, 1, limit)
  end
end