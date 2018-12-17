require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise6Test < Minitest::Test
  attr_accessor :arr1, :arr2, :arr3

  def my_any?(arr)
    size = arr.size
    index = 0
    while index < size
      return true if yield(arr[index])
      index += 1
    end
    false
  end

  def setup
    @arr1 = [1, 3, 5, 6]
    @arr2 = [1, 3, 5, 7]
    @arr3 = [2, 4, 6, 8]
  end

  def test_1
    assert(my_any?(arr1) { |value| value.even? })
  end

  def test_2
    refute(my_any?(arr2) { |value| value.even? })
  end

  def test_3
    refute(my_any?(arr3) { |value| value.odd? })
  end

  def test_4
    assert(my_any?(arr1) { |value| (value % 5).zero? })
  end

  def test_5
    assert(my_any?(arr1) { |value| true })
  end

  def test_6
    refute(my_any?(arr1) { |value| false })
  end

  def test_7
    # this works because [].size == 0 so the while
    # loop never runs and false is returned.
    refute(my_any?([]) { |value| true })
  end

end