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
end
