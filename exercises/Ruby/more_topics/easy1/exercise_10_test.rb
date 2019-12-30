require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise10Test < Minitest::Test
  attr_accessor :arr1, :arr2

  def my_count(arr)
    size = arr.size
    index = 0
    matched = []
    while index < size
      matched << arr[index] if yield(arr[index])
      index += 1
    end
    matched.count
  end

  def setup
    @arr1 = (1..5).to_a
    @arr2 = %w(Four score and seven)
  end

  def test_1
    assert_equal(3, my_count(arr1) { |value| value.odd? })
  end

  def test_2
    assert_equal(2, my_count(arr1) { |value| (value % 3) == 1 })
  end

  def test_3
    assert_equal(5, my_count(arr1) { |value| true })
  end

  def test_4
    assert_equal(0, my_count(arr1) { |value| false })
  end

  def test_5
    assert_equal(0, my_count([]) { |value| value.even? })
  end

  def test_6
    assert_equal(2, my_count(arr2) { |value| value.length == 5 })
  end
end