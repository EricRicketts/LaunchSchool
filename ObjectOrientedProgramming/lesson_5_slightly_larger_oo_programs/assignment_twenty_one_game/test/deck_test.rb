require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../lib/deck'

class DeckTest < Minitest::Test
  attr_accessor :deck

  def setup
    @deck = Deck.new
  end

  def test_size
    assert(52 == deck.number_of_cards)
  end

  def test_shuffle
    new_deck = Deck.new
    deck.shuffle
    refute(deck.cards.each.with_index.all? do |card, idx|
      card == new_deck.cards[idx]
    end)
  end

  def test_give_one_card
    assert_instance_of(Card, deck.deal(1).first)
  end

  def test_give_multiple_cards
    cards = deck.deal(2)
    assert(cards.all?(Card))
  end
end