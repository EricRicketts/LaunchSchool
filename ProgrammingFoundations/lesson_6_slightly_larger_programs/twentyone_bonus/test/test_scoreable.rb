require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/dealable.rb'
require_relative '../app/scoreable.rb'

class TestScoreableScoring < Minitest::Test
  include Dealable
  include Scoreable

  def setup
    @deck = create_deck
  end

  def test_score_cards_no_aces
    result = total({"JS" => 10, "2H" => 2, "7D" => 7})
    assert_equal(19, result)
  end

  def test_score_with_ace_equal_eleven
    result = total({"4S" => 4, "5D" => 5, "AS" => 11})
    assert_equal(20, result)
  end

  def test_score_twenty_one_with_ace
    cards = {"KS" => 10, "AS" => 11}
    assert_equal(21, total(cards))
  end

  def test_score_with_two_aces_changing_value
    cards = {"4S" => 4, "3D" => 3, "AS" => 11}
    result = total(cards)
    assert_equal(18, result)
    cards.merge!({"AC" => 11})
    result = total(cards)
    assert_equal(19, result)
    assert_equal({"4S" => 4, "3D" => 3, "AS" => 1, "AC" => 11}, cards)
    cards.merge!({"5H" => 5})
    result = total(cards)
    assert_equal(14, result)
    assert_equal({"4S" => 4, "3D" => 3, "AS" => 1, "AC" => 1, "5H" => 5}, cards)
  end

  def test_score_with_all_aces
    cards = {"AC" => 11, "AD" => 11}
    result = total(cards)
    assert_equal(12, result)
    assert_equal({"AC" => 1, "AD" => 11}, cards)
    cards.merge!({"AH" => 11})
    result = total(cards)
    assert_equal(13, result)
    assert_equal({"AC" => 1, "AD" => 1, "AH" => 11}, cards)
    cards.merge!({"AS" => 11})
    result = total(cards)
    assert_equal(14, result)
    assert_equal({"AC" => 1, "AD" => 1, "AH" => 1, "AS" => 11}, cards)
  end

  def test_score_over_twenty_one_no_aces
    cards = {"JS" => 10, "5D" => 5, "7H" => 7}
    score = total(cards)
    assert(busted?(score) && 22 == score)
  end

  def test_score_over_twenty_one_with_aces
    cards = {"JS" => 10, "5D" => 5, "AH" => 11}
    score = total(cards)
    assert(16 == score && {"JS" => 10, "5D" => 5, "AH" => 1} == cards)
    cards.merge!({"8D" => 8})
    score = total(cards)
    assert(busted?(score) && 24 == score && {"JS" => 10, "5D" => 5, "AH" => 1, "8D" => 8} == cards)
  end

end

class TestScoreableRoundResults < Minitest::Test
  include Scoreable

  def test_busted
    assert(busted?(22))
  end

  def test_not_busted
    refute(busted?(21))
  end

  def test_player_busts
    player_score = 22
    dealer_score = 17
    result = return_round_result(player_score, dealer_score)
    assert_equal(:player_busts, result)
  end

  def test_dealer_busts
    player_score = 17
    dealer_score = 22
    result = return_round_result(player_score, dealer_score)
    assert_equal(:dealer_busts, result)
  end

  def test_winner_player_beats_dealer
    player_score = 18
    dealer_score = 17
    result = return_round_result(player_score, dealer_score)
    assert_equal(:player, result)
  end

  def test_winner_dealer_beats_player
    dealer_score = 18
    player_score = 17
    result = return_round_result(player_score, dealer_score)
    assert_equal(:dealer, result)
  end

  def test_winner_tie
    dealer_score = 18
    player_score = 18
    result = return_round_result(player_score, dealer_score)
    assert_equal(:tie, result)
  end

end

class TestScoreableUpdateTallyAndGetWinner < Minitest::Test
  include Scoreable

  def setup
    @game_tally = { player: 0, dealer: 0 }
  end

  def test_init_tally
    assert_equal(@game_tally, initialize_game_tally)
  end

  def test_update_tally_player_bust
    round_result = :player_busts
    update_tally(round_result, @game_tally)
    assert_equal({ player: 0, dealer: 1 }, @game_tally)
  end

  def test_update_tally_dealer_bust
    round_result = :dealer_busts
    update_tally(round_result, @game_tally)
    assert_equal({ player: 1, dealer: 0 }, @game_tally)
  end

  def test_update_tally_player_wins
    round_result = :player
    update_tally(round_result, @game_tally)
    assert_equal({ player: 1, dealer: 0 }, @game_tally)
  end

  def test_update_tally_dealer_wins
    round_result = :dealer
    update_tally(round_result, @game_tally)
    assert_equal({ player: 0, dealer: 1 }, @game_tally)
  end

  def test_update_tally_tie
    round_result = :tie
    update_tally(round_result, @game_tally)
    assert_equal({ player: 0, dealer: 0 }, @game_tally)
  end

  def test_no_winner
    game_tally = { player: 4, dealer: 3 }
    assert_equal(:no_winner, return_winner(game_tally))
  end

  def test_player_wins
    game_tally = { player: 5, dealer: 4 }
    assert_equal(:player_wins, return_winner(game_tally))
  end

  def test_dealer_wins
    game_tally = { player: 4, dealer: 5 }
    assert_equal(:dealer_wins, return_winner(game_tally))
  end

end


  # def test_display_player_bust
  #   round_result = :player_busts
  #   player_score = 24
  #   dealer_score = 17
  #   expected = "Player busts!!  Dealer wins!!"
  #   assert_equal(expected, display_round_results(round_result, player_score, dealer_score))
  # end

  # def test_display_dealer_bust
  #   round_result = :dealer_busts
  #   player_score = 17
  #   dealer_score = 24
  #   expected = "Dealer busts!!  Player wins!!"
  #   assert_equal(expected, display_round_results(round_result, player_score, dealer_score))
  # end

  # def test_display_player_wins
  #   round_result = :player
  #   player_score = 20
  #   dealer_score = 17
  #   expected = "Player score: 20, Dealer score: 17.  Player wins!!"
  #   assert_equal(expected, display_round_results(round_result, player_score, dealer_score))
  # end

  # def test_display_dealer_wins
  #   round_result = :dealer
  #   player_score = 17
  #   dealer_score = 20
  #   expected = "Player score: 17, Dealer score: 20.  Dealer wins!!"
  #   assert_equal(expected, display_round_results(round_result, player_score, dealer_score))
  # end

  # def test_display_tie
  #   round_result = :tie
  #   player_score = 20
  #   dealer_score = 20
  #   expected = "Player score: 20, Dealer score: 20.  A tie!!"
  #   assert_equal(expected, display_round_results(round_result, player_score, dealer_score))
  # end

  # def test_select_winner_no_results
  #   game_tally = { player: 4, dealer: 4 }
  #   assert_equal(:no_winner, return_winner(game_tally))
  # end

  # def test_select_winner_player
  #   game_tally = { player: 5, dealer: 4 }
  #   assert_equal(:player_wins, return_winner(game_tally))
  # end

  # def test_select_winner_dealer
  #   game_tally = { player: 4, dealer: 5 }
  #   assert_equal(:dealer_wins, return_winner(game_tally))
  # end

  # def test_display_winner_player
  #   assert_equal("Player wins the game!!", display_winner(:player_wins))
  # end

  # def test_display_dealer_winner
  #   assert_equal("Dealer wins the game!!", display_winner(:dealer_wins))
  # end