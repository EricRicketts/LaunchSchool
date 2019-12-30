require 'minitest/autorun'
require 'minitest/pride'

class QuestionFour < Minitest::Test
  def test_array_delete_method
    numbers = [1, 2, 3, 4, 5]
    assert_equal 1, numbers.delete(1)
    assert_equal [2, 3, 4, 5], numbers
  end

  def test_array_delete_at_method
    numbers = [1, 2, 3, 4, 5]
    assert_equal 2, numbers.delete_at(1)
    assert_equal [1, 3, 4, 5], numbers
  end
end
