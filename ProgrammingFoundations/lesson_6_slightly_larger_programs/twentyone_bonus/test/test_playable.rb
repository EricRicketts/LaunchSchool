require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/playable.rb'

class TestPlayable < Minitest::Test
  include Playable

  def setup
    @deck = create_deck
  end

  def test_deal_cards_to_contestants
    player_hand, dealer_hand = initialize_hands
    start_round(@deck, player_hand, dealer_hand)
    expected = [{ '2C' => 2, '4C' => 4 }, { '3C' => 3, '5C' => 5 }, 48]
    assert_equal(expected, [player_hand, dealer_hand, @deck.size])
  end

  def test_get_scores
    player_hand, dealer_hand = initialize_hands
    start_round(@deck, player_hand, dealer_hand)
    player_score, dealer_score = start_scoring(player_hand, dealer_hand)
    assert_equal([6, 8], [player_score, dealer_score])
  end

end
