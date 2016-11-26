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
    assert_equal win?("scissors", "scissors"), TIE, "scissors tie"
  end

  def test_paper_vs_rock
    assert_equal win?("paper", "rock"), PLAYER_WINS, "paper first"
    assert_equal win?("rock", "paper"), COMPUTER_WINS, "paper first"
    assert_equal win?("rock", "rock"), TIE, "rock tie"
  end

  def test_rock_vs_lizard
    assert_equal win?("rock", "lizard"), PLAYER_WINS, "rock first"
    assert_equal win?("lizard", "rock"), COMPUTER_WINS, "lizard first"
  end

  def test_lizard_vs_spock
    assert_equal win?("lizard", "spock"), PLAYER_WINS, "lizard first"
    assert_equal win?("spock", "lizard"), COMPUTER_WINS, "spock first"
    assert_equal win?("lizard", "lizard"), TIE, "lizard tie"
  end

  def test_spock_vs_scissors
    assert_equal win?("spock", "scissors"), PLAYER_WINS, "spock first"
    assert_equal win?("scissors", "spock"), COMPUTER_WINS, "scissors first"
  end

  def test_scissors_vs_lizard
    assert_equal win?("scissors", "lizard"), PLAYER_WINS, "scissors first"
    assert_equal win?("lizard", "scissors"), COMPUTER_WINS, "lizard first"
  end

  def test_lizard_vs_paper
    assert_equal win?("lizard", "paper"), PLAYER_WINS, "lizard first"
    assert_equal win?("paper", "lizard"), COMPUTER_WINS, "paper first"
  end

  def test_paper_vs_spock
    assert_equal win?("paper", "spock"), PLAYER_WINS, "paper first"
    assert_equal win?("spock", "paper"), COMPUTER_WINS, "spock first"
    assert_equal win?("paper", "paper"), TIE, "paper tie"
  end

  def test_spock_vs_rock
    assert_equal win?("spock", "rock"), PLAYER_WINS, "spock first"
    assert_equal win?("rock", "spock"), COMPUTER_WINS, "rock first"
    assert_equal win?("spock", "spock"), TIE, "spock tie"
  end
end
