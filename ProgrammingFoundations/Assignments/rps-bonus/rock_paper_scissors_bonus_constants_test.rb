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

  def test_user_choices
    expected_msg = "Choose one:\n" \
    "(R/r) Rock, (P/p) Paper, (Sc/sc) Scissors, " \
    "(L/l) Lizard, or (Sp/sp) Spock\n"
    assert_equal APP_CONFIG['ChoiceMsg'], expected_msg, 'choice message'
  end

  def test_error_message
    expected_msg =
      "Hmm... that does not look like a valide response, try again."
    assert_equal APP_CONFIG['InvalidResponseMsg'], expected_msg, 'invalid msg'
  end

  def test_player_wins_message
    expected_msg = "You win!!"
    assert_equal APP_CONFIG['PlayerWinsMsg'], expected_msg, 'player wins'
  end

  def test_computer_wins_message
    expected_msg = "Computer wins!!"
    assert_equal APP_CONFIG['ComputerWinsMsg'], expected_msg, 'computer wins'
  end

  def test_tie_message
    expected_msg = "It is a tie!!"
    assert_equal APP_CONFIG['TieMsg'], expected_msg, 'tie msg'
  end
end
