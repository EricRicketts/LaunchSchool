require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise6Test < Minitest::Test

  def my_each_with_index(arr)
    size = arr.size
    index = 0

    while index < size
      yield(arr[index], index)
      index += 1
    end

    arr
  end

  def test_each_with_index
    arr = [1, 3, 6]
    ary = []
    expected = [
      [
        "0 -> 1",
        "1 -> 3",
        "2 -> 36"
      ],
      [1, 3, 6]
    ]
    return_value = my_each_with_index(arr) do |value, index|
      ary << "#{index} -> #{value**index}"
    end
    assert_equal(expected, [ary, return_value])
  end
end