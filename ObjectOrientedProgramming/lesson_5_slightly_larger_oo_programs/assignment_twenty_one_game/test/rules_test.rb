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

  def test_initialize_deck_values
    game.set_values(deck.cards)
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
    game.set_values(cards)
    assert_equal(15, game.score(cards))
  end

  def test_one_ace_added
    cards.push(Card.new("Hearts", "Ace"))
    game.set_values(cards)
    assert_equal(16, game.score(cards))
  end

  def test_perfect_score_with_ace
    cards = [
      Card.new("Clubs", "King"), Card.new("Diamonds", "Ace")
    ]
    game.set_values(cards)
    assert_equal(21, game.score(cards))
  end

  def test_monitor_score_as_aces_added
    cards = []
    array_of_cards = [
      Card.new("Clubs", "5"), Card.new("Clubs", "Ace"),
      Card.new("Hearts", "3"), Card.new("Diamonds", "Ace"),
      Card.new("Spades", "Ace")
    ]
    expected_scores = [5, 16, 19, 20, 21]
    array_of_cards.each.with_index do |card, idx|
      cards.push(card)
      game.set_values(cards)
      expected_score = expected_scores[idx]
      assert_equal(expected_score, game.score(cards))
    end
  end

  def test_not_busted
    game.set_values(cards)
    refute(game.busted?(cards))
  end

  def test_busted
    cards.push(Card.new("Hearts", "7"))
    game.set_values(cards)
    assert(game.busted?(cards))
  end

  def test_dealer_cutoff
    game.set_values(cards)
    first_cutoff = game.dealer_stays?(cards)
    cards.push(Card.new("Hearts", "3"))
    game.set_values(cards)
    second_cutoff = game.dealer_stays?(cards)
    assert_equal([false, true], [first_cutoff, second_cutoff])
  end
end