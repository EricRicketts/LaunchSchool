require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise5Test < Minitest::Test
  attr_accessor :arr

  def my_drop_while(arr)
    index = 0
    size = arr.size

    while index < size
      break unless yield(arr[index])
      index += 1
    end

    arr[index..-1]
  end

  def setup
    @arr = [1, 3, 5, 6]
  end

  def test_drop_all_odds
    result = my_drop_while(arr) { |value| value.odd? }
    assert_equal([6], result)
  end

  def test_drop_all_evens
    result = my_drop_while(arr) { |value| value.even? }
    assert_equal([1, 3, 5, 6], result)
  end

  def test_all_true
    result = my_drop_while(arr) { |value| true }
    assert_empty(result)
  end

  def test_all_false
    result = my_drop_while(arr) { |value| false }
    assert_equal(arr, result)
  end

  def test_numbers_less_than_five
    result = my_drop_while(arr) { |value| value < 5 }
    assert_equal([5, 6], result)
  end

  def test_empty_array
    result = my_drop_while([]) { |value| true }
    assert_empty(result)
  end
end