require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  def test_replace_substring
    advice = "Few things in life are as important " \
      "as house training your pet dinosaur."
    expected_string = "Few things in life are as urgent " \
      "as house training your pet dinosaur."
    advice.sub!(/important/, 'urgent')
    assert_equal expected_string, advice
  end
end
