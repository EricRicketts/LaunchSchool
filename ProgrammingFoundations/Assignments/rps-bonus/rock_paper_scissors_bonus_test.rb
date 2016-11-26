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
    assert_equal display_turn_winner("scissors", "paper"), @player_wins
    assert_equal display_turn_winner("paper", "scissors"), @computer_wins
    assert_equal display_turn_winner("scissors", "scissors"), @tie
  end

  def test_paper_vs_rock
    assert_equal display_turn_winner("paper", "rock"), @player_wins
    assert_equal display_turn_winner("rock", "paper"), @computer_wins
    assert_equal display_turn_winner("rock", "rock"), @tie
  end

  def test_rock_vs_lizard
    assert_equal display_turn_winner("rock", "lizard"), @player_wins
    assert_equal display_turn_winner("lizard", "rock"), @computer_wins
  end

  def test_lizard_vs_spock
    assert_equal display_turn_winner("lizard", "spock"), @player_wins
    assert_equal display_turn_winner("spock", "lizard"), @computer_wins
    assert_equal display_turn_winner("lizard", "lizard"), @tie
  end

  def test_spock_vs_scissors
    assert_equal display_turn_winner("spock", "scissors"), @player_wins
    assert_equal display_turn_winner("scissors", "spock"), @computer_wins
  end

  def test_scissors_vs_lizard
    assert_equal display_turn_winner("scissors", "lizard"), @player_wins
    assert_equal display_turn_winner("lizard", "scissors"), @computer_wins
  end

  def test_lizard_vs_paper
    assert_equal display_turn_winner("lizard", "paper"), @player_wins
    assert_equal display_turn_winner("paper", "lizard"), @computer_wins
  end

  def test_paper_vs_spock
    assert_equal display_turn_winner("paper", "spock"), @player_wins
    assert_equal display_turn_winner("spock", "paper"), @computer_wins
    assert_equal display_turn_winner("paper", "paper"), @tie
  end

  def test_spock_vs_rock
    assert_equal display_turn_winner("spock", "rock"), @player_wins
    assert_equal display_turn_winner("rock", "spock"), @computer_wins
    assert_equal display_turn_winner("spock", "spock"), @tie
  end

  def test_rock_vs_scissors
    assert_equal display_turn_winner("rock", "scissors"), @player_wins
    assert_equal display_turn_winner("scissors", "rock"), @computer_wins
  end

  def test_update_game_score_user_wins
    user_choice = "rock"
    computer_choice = "scissors"
    update_game_score(user_choice, computer_choice, @hsh)
    assert_equal @hsh, { player_score: 1, computer_score: 0 }
  end

  def test_update_game_score_computer_wins
    user_choice = "scissors"
    computer_choice = "rock"
    update_game_score(user_choice, computer_choice, @hsh)
    assert_equal @hsh, { player_score: 0, computer_score: 1 }
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
