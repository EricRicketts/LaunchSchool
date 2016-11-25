require 'minitest/autorun'
require 'minitest/pride'
require_relative './rock_paper_scissors_bonus'
require 'byebug'

# test constants used for the game
class RockPaperScissorsBonusConstantsTest < Minitest::Test
  RULES = "Here are the rules:\n" \
      "Scissors cuts Paper\n" \
      "Paper covers Rock\n" \
      "Rock crushes Lizard\n" \
      "Lizard poisons Spock\n" \
      "Spock smashes Scissors\n" \
      "Scissors decapitates Lizard\n" \
      "Lizard eats Paper\n" \
      "Paper disproves Spock\n" \
      "Spock vaporizes Rock\n"

  def test_greeting
    expected_msg = "Welcome to Rock, Paper, Scissors, Lizard, and Spock!\n" \
      "You opponent will be the computer, the first to five\n" \
      "points wins the game, ties do not count.\n" + RULES
    assert_equal APP_CONFIG['GreetingMsg'], expected_msg, 'greeting message'
  end
end
