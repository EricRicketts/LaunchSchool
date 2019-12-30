require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise1Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = []
  end

  def step(start_value, end_value, step_value)
    err_msg = "step value cannot be less than 1"
    raise ArgumentError, err_msg if step_value < 1
    count = start_value
    while count <= end_value
      yield(count)
      count += step_value
    end
    count
  end

  def test_positive_number_range
    expected = [1, 3, 5, 7, 9]
    step(1, 10, 2) { |n| arr << n}
    assert_equal(expected, arr)
  end

  def test_negative_number_range
    expected = [-10, -8, -6, -4, -2]
    step(-10, -1, 2) { |n| arr << n}
    assert_equal(expected, arr)
  end

  def test_mixed_range
    expected = [-5, -2, 1, 4]
    step(-5, 5, 3) { |n| arr << n }
    assert_equal(expected, arr)
  end

  def test_negative_step_value
    err = assert_raises(ArgumentError) { step(10, 1, -2) }
    assert_equal("step value cannot be less than 1", err.message)
  end
end
