require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/viewable.rb'

class TestViewable < Minitest::Test
  include Viewable

  def test_game_tally
    game_tally = { player: 1, dealer: 0 }
    expected = "=> Current tally:  Player 1, Dealer 0.\n"
    assert_output(expected) { display_game_tally(game_tally) }
  end

  def test_display_score
    expected = "=> Dealer score is: 13\n"
    assert_output(expected) { display_one_score("Dealer", 13) }
  end

  def test_round_results_player_bust
    expected = "=> Round score: Player 24, Dealer 20.\n" +
      "=> Player busts, Dealer wins!!\n"
    assert_output(expected) { display_round_results(:player_busts, 24, 20) }
  end

  def test_round_results_dealer_bust
    expected = "=> Round score: Player 20, Dealer 24.\n" +
      "=> Dealer busts, Player wins!!\n"
    assert_output(expected) { display_round_results(:dealer_busts, 20, 24) }
  end

  def test_round_results_player_wins
    expected = "=> Round score: Player 19, Dealer 17.\n" +
      "=> Player wins!!\n"
    assert_output(expected) { display_round_results(:player, 19, 17) }
  end

  def test_round_results_dealer_wins
    expected = "=> Round score: Player 17, Dealer 19.\n" +
      "=> Dealer wins!!\n"
    assert_output(expected) { display_round_results(:dealer, 17, 19) }
  end

  def test_round_results_tie
    expected = "=> Round score: Player 20, Dealer 20.\n" +
      "=> A tie!!\n"
    assert_output(expected) { display_round_results(:tie, 20, 20) }
  end

  def test_game_winner_player
    assert_output("=> Player wins the game!!\n") { display_game_winner(:player_wins) }
  end

  def test_game_winner_dealer
    assert_output("=> Dealer wins the game!!\n") { display_game_winner(:dealer_wins) }
  end

  def test_game_winner_none
    assert_output("=> No winner!!\n") { display_game_winner(:no_winner) }
  end

end
