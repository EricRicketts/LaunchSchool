require 'minitest/autorun'
require 'minitest/pride'

class QuestionFive < Minitest::Test
  def test_count_lower_case_t
    statement = "Flintstones rock!"
    assert_equal 2, statement.scan('t').count
  end
end