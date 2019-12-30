require 'minitest/autorun'
require 'minitest/pride'

class QuestionSix < Minitest::Test
  def test_center_string
    title = "Flintstone Family Members"
    expected = "     Flintstone Family Members     "
    assert_equal expected, title.center(title.length + 10)
  end
end