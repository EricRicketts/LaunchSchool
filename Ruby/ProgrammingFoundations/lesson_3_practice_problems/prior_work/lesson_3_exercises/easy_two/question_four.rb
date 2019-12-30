require 'minitest/autorun'
require 'minitest/pride'

class QuestionFour < Minitest::Test
  def setup
    @munsters_description = "The Munsters are creepy in a good way."
  end

  def test_string_manipulation_one
    expected = "The munsters are creepy in a good way."
    assert_equal expected, @munsters_description.gsub("Munsters", "munsters")
    assert_equal expected, @munsters_description.capitalize
  end

  def test_string_manipulation_two
    expected = "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
    assert_equal expected, @munsters_description.swapcase
  end

  def test_string_manipulation_three
    expected = "the munsters are creepy in a good way."
    assert_equal expected, @munsters_description.downcase
  end

  def test_string_manipulation_four
    expected = "THE MUNSTERS ARE CREEPY IN A GOOD WAY."
    assert_equal expected, @munsters_description.upcase
  end
end
