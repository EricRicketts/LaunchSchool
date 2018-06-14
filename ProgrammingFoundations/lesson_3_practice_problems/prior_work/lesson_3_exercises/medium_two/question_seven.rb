require 'minitest/autorun'
require 'minitest/pride'

# What is the result of the following call?
class QuestionSeven < Minitest::Test
  def setup
    def rps(fist1, fist2)
      if fist1 == "rock"
        (fist2 == "paper") ? "paper" : "rock"
      elsif fist1 == "paper"
          (fist2 == "scissors") ? "scissors" : "paper"
      else
        (fist2 == "rock") ? "rock" : "scissors"
      end
    end
  end

  def test_rps_call
    assert_equal "paper", rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
  end
end