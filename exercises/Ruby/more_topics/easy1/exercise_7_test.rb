require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise7Test < Minitest::Test
  attr_accessor :arr1, :arr2, :arr3

  def my_all?(arr)
    size = arr.size
    index = 0
    while index < size
      return false unless yield(arr[index])
      index += 1
    end
    true
  end

  def setup
    @arr1 = [1, 3, 5, 6]
    @arr2 = [1, 3, 5, 7]
    @arr3 = [2, 4, 6, 8]
  end

  def test_1
    refute(my_all?(arr1) { |value| value.odd? })
  end

  def test_2
    assert(my_all?(arr2) { |value| value.odd? })
  end

  def test_3
    assert(my_all?(arr3) { |value| value.even? })
  end

  def test_4
    refute(my_all?(arr1) { |value| (value % 5).zero? })
  end

  def test_5
    assert(my_all?(arr1) { |value| true })
  end

  def test_6
    refute(my_all?(arr1) { |value| false })
  end

  def test_7
    assert(my_all?([]) { |value| true })
  end
end