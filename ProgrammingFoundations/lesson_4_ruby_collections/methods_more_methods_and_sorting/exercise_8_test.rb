require 'minitest/autorun'
require 'minitest/pride'

class Exercise8Test < Minitest::Test
  def test_take
    arr = [1, 2, 3, 4, 5]
    assert_equal [1, 2], arr.take(2)
    assert_equal [1, 2, 3, 4, 5], arr
  end
end