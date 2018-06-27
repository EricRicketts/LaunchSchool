require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/dealable.rb'

class TestCardDeck < Minitest::Test
  include Dealable

  def setup
    @deck = create_deck
  end

  def test_card_deck_size
    assert(52 == @deck.size)
  end

  def test_random_cards
    assert(2 == @deck["2C"] && 10 == @deck["JD"] && 1 == @deck["AS"] && 7 == @deck["7H"])
  end

  def test_shuffle_deck
    shuffled_deck = shuffle_deck(@deck)
    card, value = @deck.first
    suit = card[1]
    deck_slice = shuffled_deck.to_a.slice(0, 13)
    all_cards_same_suit = deck_slice.all? { |card, value| suit == card[1] }
    assert(shuffled_deck.is_a?(Hash) && !all_cards_same_suit)
  end

  def test_deal_card
    card, value = deal_card(@deck)
    assert(card == "2C" && value == 2 && @deck.size == 51)
  end

end
