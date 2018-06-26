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
  
end