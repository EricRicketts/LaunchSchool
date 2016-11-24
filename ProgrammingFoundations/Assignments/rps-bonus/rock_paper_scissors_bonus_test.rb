require 'minitest/autorun'
require 'minitest/pride'
require_relative './rock_paper_scissors_bonus'

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
end
