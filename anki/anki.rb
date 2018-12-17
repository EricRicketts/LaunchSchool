require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'


class Anki < Minitest::Test
  attr_accessor :arr

  def my_each(collection, &block)
    size = collection.size
    index = 0
    while index < size
      yield(collection[index])
      index += 1
    end
    collection
  end

  def my_select_v1(collection)
    size = collection.size
    result = []
    index = 0
    while index < size
      result << collection[index] if yield(collection[index])
      index += 1
    end
    result
  end

  def my_select_v2(collection, &block)
    result = []
    my_each(collection) do |n|
      result << n if block.call(n)
    end
    result
  end

  def setup
    @arr = (1..10).to_a
  end

  def test_select_variants
    result1 = my_select_v1(arr) { |n| n.odd? }
    result2 = my_select_v2(arr) { |n| n.odd? }
    expected = [
      [1, 3, 5, 7, 9],
      [1, 3, 5, 7, 9]
    ]
    assert_equal(expected, [result1, result2])
  end

end
