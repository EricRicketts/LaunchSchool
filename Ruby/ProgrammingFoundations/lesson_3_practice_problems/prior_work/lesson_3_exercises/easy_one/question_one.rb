require 'minitest/autorun'
require 'minitest/pride'

class QuestionOne < Minitest::Test
  def test_uniq_results
    numbers = [1, 2, 2, 3]
    new_numbers = numbers.uniq

    assert_equal numbers, [1, 2, 2, 3]
    assert_equal new_numbers, [1, 2, 3]
  end
end
