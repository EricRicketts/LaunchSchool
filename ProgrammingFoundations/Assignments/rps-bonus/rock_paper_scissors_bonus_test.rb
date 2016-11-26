require 'minitest/autorun'
require 'minitest/pride'
require_relative './rock_paper_scissors_bonus'

# test main logic of rock paper scissors game with bonus features
class TestObjectRelationships < Minitest::Test
  def setup
    @hsh = { player_score: 0, computer_score: 0 }
    @player_wins = prompt(APP_CONFIG['PlayerWinsMsg'])
    @computer_wins = prompt(APP_CONFIG['ComputerWinsMsg'])
    @tie = prompt(APP_CONFIG['TieMsg'])
  end

  def test_scissors_vs_paper
    assert_equal win?("scissors", "paper", @hsh), @player_wins
    assert_equal win?("paper", "scissors", @hsh), @computer_wins
    assert_equal win?("scissors", "scissors", @hsh), @tie
  end

  def test_paper_vs_rock
    assert_equal win?("paper", "rock", @hsh), @player_wins
    assert_equal win?("rock", "paper", @hsh), @computer_wins
    assert_equal win?("rock", "rock", @hsh), @tie
  end

  def test_rock_vs_lizard
    assert_equal win?("rock", "lizard", @hsh), @player_wins
    assert_equal win?("lizard", "rock", @hsh), @computer_wins
  end

  def test_lizard_vs_spock
    assert_equal win?("lizard", "spock", @hsh), @player_wins
    assert_equal win?("spock", "lizard", @hsh), @computer_wins
    assert_equal win?("lizard", "lizard", @hsh), @tie
  end

  def test_spock_vs_scissors
    assert_equal win?("spock", "scissors", @hsh), @player_wins
    assert_equal win?("scissors", "spock", @hsh), @computer_wins
  end

  def test_scissors_vs_lizard
    assert_equal win?("scissors", "lizard", @hsh), @player_wins
    assert_equal win?("lizard", "scissors", @hsh), @computer_wins
  end

  def test_lizard_vs_paper
    assert_equal win?("lizard", "paper", @hsh), @player_wins
    assert_equal win?("paper", "lizard", @hsh), @computer_wins
  end

  def test_paper_vs_spock
    assert_equal win?("paper", "spock", @hsh), @player_wins
    assert_equal win?("spock", "paper", @hsh), @computer_wins
    assert_equal win?("paper", "paper", @hsh), @tie
  end

  def test_spock_vs_rock
    assert_equal win?("spock", "rock", @hsh), @player_wins
    assert_equal win?("rock", "spock", @hsh), @computer_wins
    assert_equal win?("spock", "spock", @hsh), @tie
  end

  def test_rock_vs_scissors
    assert_equal win?("rock", "scissors", @hsh), @player_wins
    assert_equal win?("scissors", "rock", @hsh), @computer_wins
  end
end

# test #display_selections and #player_choice
class TestMiscellaneous < Minitest::Test
  def test_display_selections
    expected_msg = "=> your choice: rock\n=> computer choice: paper"
    assert_equal display_selections("rock", "paper"), expected_msg
  end

  def test_player_wins_game
    game_score_hash = {
      player_score: 5,
      computer_score: 4
    }
    assert game_over?(game_score_hash)
  end

  def test_computer_wins_game
    game_score_hash = {
      player_score: 4,
      computer_score: 5
    }
    assert game_over?(game_score_hash)
  end

  def test_no_game_winner
    game_score_hash = {
      player_score: 4,
      computer_score: 4
    }
    refute game_over?(game_score_hash)
  end

  def test_running_totals
    game_score_hash = { player_score: 3, computer_score: 4 }
    expected_msg = "=> your score: 3 computer score: 4"
    assert_equal display_current_scores(game_score_hash), expected_msg
  end

  def test_display_final_score_user_wins
    game_score_hash = { player_score: 5, computer_score: 3 }
    expected_msg = "=> You win the game!!"
    assert_equal display_game_winner(game_score_hash), expected_msg
  end

  def test_display_final_score_computer_wins
    game_score_hash = { player_score: 2, computer_score: 5 }
    expected_msg = "=> The computer wins the game!!"
    assert_equal display_game_winner(game_score_hash), expected_msg
  end
end
