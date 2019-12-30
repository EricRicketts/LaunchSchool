require 'minitest/autorun'
require 'minitest/pride'

class QuestionsFive < Minitest::Test
  def test_range_includes
    assert (10..100).cover?(42)
  end
end