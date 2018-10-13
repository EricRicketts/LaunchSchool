require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseTwoTest < Minitest::Test
  class FixedArray < Array
    attr_reader :size

    def initialize(size)
      super(size)
      @size = size
    end

    def [](index)
      out_of_bounds(index) ? super(index) : self.fetch(index)
    end

    def []=(index, value)
      out_of_bounds(index) ? super(index, value) : self.fetch(index)
    end

    private

    def out_of_bounds(index)
      (-self.size..self.size - 1).include?(index)
    end
  end
  def test_one
    fixed_array = FixedArray.new(5)
    assert(fixed_array[3] == nil)
    assert(fixed_array.to_a == [nil] * 5)

    fixed_array[3] = 'a'
    assert(fixed_array[3] == 'a')
    assert(fixed_array.to_a == [nil, nil, nil, 'a', nil])

    fixed_array[1] = 'b'
    assert(fixed_array[1] == 'b')
    assert(fixed_array.to_a == [nil, 'b', nil, 'a', nil])

    fixed_array[1] = 'c'
    assert(fixed_array[1] == 'c')
    assert(fixed_array.to_a == [nil, 'c', nil, 'a', nil])

    fixed_array[4] = 'd'
    assert(fixed_array[4] == 'd')
    assert(fixed_array.to_a == [nil, 'c', nil, 'a', 'd'])
    assert(fixed_array.to_s == '[nil, "c", nil, "a", "d"]')

    assert(fixed_array[-1] == 'd')
    assert(fixed_array[-4] == 'c')

    assert_raises(IndexError) { fixed_array[6] }
    assert_raises(IndexError) { fixed_array[-7] = 3 }
  end
end