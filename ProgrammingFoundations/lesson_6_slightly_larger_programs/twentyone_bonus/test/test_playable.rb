require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/playable.rb'

class TestPlayable < Minitest::Test
  include Playable

  def test_initialize_game
    unshuffled_deck = create_deck
    deck = shuffle_deck(unshuffled_deck)
    player_hand, dealer_hand, game_tally, *rest = init_game(deck)
    player_score, dealer_score, player_bust, dealer_bust = *rest
    assert(game_tally.values.all? { |score| score.zero? })
    assert(2 == player_hand.size && 2 == dealer_hand.size)
    assert(player_hand.is_a?(Hash) && dealer_hand.is_a?(Hash))
    assert(player_score <= 21 && dealer_score <= 21 && !player_bust && !dealer_bust)
  end

  def test_deck_empty_player_wins
    game_tally = { player: 4, dealer: 3 }
    result = "=> Deck is empty!!  Current game score: Player 4, Dealer 3.  Player wins!!\n"
    assert_output(result) { declare_winner_deck_empty(game_tally) }
  end

  def test_deck_empty_dealer_wins
    game_tally = { player: 3, dealer: 4 }
    result = "=> Deck is empty!!  Current game score: Player 3, Dealer 4.  Dealer wins!!\n"
    assert_output(result) { declare_winner_deck_empty(game_tally) }
  end

  def test_deck_empty_tie
    game_tally = { player: 4, dealer: 4 }
    result = "=> Deck is empty!!  Current game score: Player 4, Dealer 4.  A tie!!\n"
    assert_output(result) { declare_winner_deck_empty(game_tally) }
  end

end
