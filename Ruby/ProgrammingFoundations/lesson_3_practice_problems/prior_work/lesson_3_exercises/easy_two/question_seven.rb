require 'minitest/autorun'
require 'minitest/pride'

class QuestionSeven < Minitest::Test
  def test_check_for_substring
    advice = "Few things in life are as important as house training your pet dinosaur."
    refute advice.include?("Dino")
    refute advice.match("Dino")
  end
end