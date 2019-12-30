require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise4Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = [1, 3, 6]
  end

  def my_count(*args)
    result = []
    size = args.size
    index = 0

    while index < size
      result << args[index] if yield(args[index])
      index += 1
    end

    result.size
  end

  def test_for_odd_in_args
    result = my_count(*arr) { |value| value.odd? }
    assert_equal(2, result)
  end

  def test_for_even_in_args
    result = my_count(*arr) { |value| value.even? }
    assert_equal(1, result)
  end

  def test_for_args_greater_than_six
    result = my_count(*arr) { |value| value > 6 }
    assert_equal(0, result)
  end

  def test_for_all_true_block
    result = my_count(*arr) { |value| true }
    assert_equal(3, result)
  end

  def test_no_args
    result = my_count() { |value| true }
    assert_equal(0, result)
  end

  def test_true_expression
    result = my_count(*arr) { |value| value - 6 }
    assert_equal(3, result)
  end
end