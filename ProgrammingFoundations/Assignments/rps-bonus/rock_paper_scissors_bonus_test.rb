require 'minitest/autorun'
require 'minitest/pride'
require_relative './rock_paper_scissors_bonus'
require 'byebug'

# test main logic of rock paper scissors game with bonus features
class RockPaperScissorsBonusTestObjectRelationships < Minitest::Test
  PLAYER_WINS = prompt(APP_CONFIG['PlayerWinsMsg'])
  COMPUTER_WINS = prompt(APP_CONFIG['ComputerWinsMsg'])
  TIE = prompt(APP_CONFIG['TieMsg'])

  def test_scissors_vs_paper
    assert_equal win?("scissors", "paper"), PLAYER_WINS, "scissors first"
    assert_equal win?("paper", "scissors"), COMPUTER_WINS, "paper first"
    assert_equal win?("scissors", "scissors"), TIE, 'scissors tie'
  end

  def test_paper_vs_rock
    assert_equal win?("paper", "rock"), PLAYER_WINS, "paper first"
    assert_equal win?("rock", "paper"), COMPUTER_WINS, "paper first"
    assert_equal win?("rock", "rock"), TIE, 'scissors tie'
  end

end
