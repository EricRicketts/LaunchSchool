require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  # puts "the value of 40 + 2 is " + (40 + 2)
  # it fails because you cannot concatenate a string with a number
  # there is no implicit conversion of a string into a number
  def test_string_eval
    expected = "the value of 40 + 2 is 42"
    assert_equal expected, "the value of 40 + 2 is #{40 + 2}"
    assert_equal expected, "the value of 40 + 2 is " + (40 + 2).to_s
  end
end