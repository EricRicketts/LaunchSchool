require 'minitest/autorun'
require 'minitest/pride'
require_relative './rock_paper_scissors_bonus'
require 'byebug'

# test main logic of rock paper scissors game with bonus features
class RockPaperScissorsBonusTest < Minitest::Test
  def test_rock
    assert win?("rock", "lizard"), "rock crushes lizard"
    assert win?("rock", "scissors"), "rock crushes scissocrs"
  end

  def test_paper
    assert win?("paper", "rock"), "paper covers rock"
    assert win?("paper", "spock"), "paper disproves spock"
  end

  def test_scissors
    assert win?("scissors", "lizard"), "scissors decapitates lizard"
    assert win?("scissors", "paper"), "scissors cuts paper"
  end

  def test_lizard
    assert win?("lizard", "paper"), "lizard eats paper"
    assert win?("lizard", "spock"), "lizard poisons spock"
  end

  def test_spock
    assert win?("spock", "rock"), "spock vaporizes rock"
    assert win?("spock", "scissors"), "spock smashes scissors"
  end

  def test_valid_response_single_letter
    $stdin = StringIO.new("lizard\n")
    input = gets.chomp
    assert valid_user_response?(input), "legitimate single letter input by user"
  end

  def test_valid_response_two_letters
    $stdin = StringIO.new("Spock\n")
    input = gets.chomp
    assert valid_user_response?(input), "legitimate two letter input by user"
  end

  def test_invalid_input
    $stdin = StringIO.new("Seat\n")
    input = gets.chomp
    refute valid_user_response?(input)
  end
end
