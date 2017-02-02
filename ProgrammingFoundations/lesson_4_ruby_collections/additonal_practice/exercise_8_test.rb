require 'minitest/autorun'
require 'minitest/pride'

class Exercise8Test < Minitest::Test
  def test_shift_and_iterate
    numbers = [1, 2, 3, 4]
    out = capture_io do
      numbers.each do |number|
        p number
        numbers.shift(1)
      end
    end
    assert_equal "1\n3\n", out[0]
    # this happens because each traverses the orignal indices
    # of the array, so index = 0 gives 1, but the second time through
    # index = 1 gives 3 because the array is now [2, 3, 4], now the
    # final time around index = 2 gives nothing because the remaining array is [3, 4]
  end

  def test_pop_and_iterate
    numbers = [1, 2, 3, 4]
    out = capture_io do
      numbers.each do |number|
        p number
        numbers.pop(1)
      end
    end
    assert_equal "1\n2\n", out[0]
  end
end