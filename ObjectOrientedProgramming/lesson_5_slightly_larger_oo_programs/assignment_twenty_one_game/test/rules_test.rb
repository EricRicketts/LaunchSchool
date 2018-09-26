require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/rules'
require_relative '../lib/deck'
require_relative '../lib/card'

class RulesTest < Minitest::Test
  class Game
    include Rules
  end

  attr_accessor :cards, :deck, :game

  def setup
    @cards = [
      Card.new("Spades", "5"), Card.new("Diamonds", "Jack")
    ]
    @deck = Deck.new
    @game = Game.new
  end

  def test_initialize_card_values
    game.initialize_values(deck.cards)
    two_clubs = deck.cards.find do |card|
      card.suit == "Clubs" && card.rank == "2"
    end
    jack_diamonds = deck.cards.find do |card|
      card.suit == "Diamonds" && card.rank == "Jack"
    end
    ace_spades = deck.cards.find do |card|
      card.suit == "Spades" && card.rank == "Ace"
    end

    expected = [2, 10, 11]
    result = [two_clubs.value, jack_diamonds.value, ace_spades.value]
    assert_equal(expected, result)
  end

  def test_simple_sum
    game.initialize_values(cards)
    assert_equal(15, game.score(cards))
  end
end
