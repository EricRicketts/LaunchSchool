require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise9Test < Minitest::Test
  attr_accessor :arr1, :arr2, :arr3

  def my_one?(arr)
    size = arr.size
    index = 0
    matched = []
    while index < size
      matched << arr[index] if yield(arr[index])
      index += 1
    end
    matched.length == 1
  end

  def setup
    @arr1 = [1, 3, 5, 6]
    @arr2 = [1, 3, 5, 7]
    @arr3 = [2, 4, 6, 8]
  end

  def test_1
    assert(my_one?(arr1) { |value| value.even? })
  end

  def test_2
    refute(my_one?(arr2) { |value| value.odd? })
  end

  def test_3
    refute(my_one?(arr3) { |value| value.even? })
  end

  def test_4
    assert(my_one?(arr1) { |value| (value % 5).zero? })
  end

  def test_5
    refute(my_one?(arr1) { |value| true })
  end

  def test_6
    refute(my_one?(arr1) { |value| false })
  end

  def test_7
    refute(my_one?([]) { |value| true })
  end
end