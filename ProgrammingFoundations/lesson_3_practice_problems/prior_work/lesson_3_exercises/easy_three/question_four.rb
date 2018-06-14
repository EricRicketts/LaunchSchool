require 'minitest/autorun'
require 'minitest/pride'

class QuestionFour < Minitest::Test
  def test_shorten_string
    advice = "Few things in life are as important as house training your pet dinosaur."
    expected = "house training your pet dinosaur."
    expected_slice = "Few things in life are as important as "
    sliced_string = advice.slice!("Few things in life are as important as ")
    assert_equal expected_slice, sliced_string
    assert_equal expected, advice
  end

  def test_shorten_string_another_way
    advice = "Few things in life are as important as house training your pet dinosaur."
    expected = "house training your pet dinosaur."
    expected_slice = "Few things in life are as important as "
    sliced_string = advice.slice!(0, advice.index("house"))
    assert_equal expected_slice, sliced_string
    assert_equal expected, advice
  end
end