require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/player'
require_relative '../lib/card'

class PlayerTest < Minitest::Test
  attr_accessor :player

  def setup
    @player = Player.new("Fred")
  end

  def test_name
    assert_equal("Fred", player.name)
  end

  def test_take_one_card
    cards = [Card.new("Heart", "7")]
    player.take(cards)
    assert_equal(cards, player.cards)
  end

  def test_take_multiple_cards
    cards = [Card.new("Spades", "Ace"), Card.new("Hearts", "King")]
    player.take(cards)
    assert_equal(cards, player.cards)
  end

  def test_change_status
    original = player.status
    player.status = :stay
    assert_equal([:hit, :stay], [original, player.status])
  end

  def test_reset_cards
    cards = [Card.new("Diamonds", "Jack"), Card.new("Clubs", "Queen")]
    player.take(cards)
    player.status = :stay
    original = player.cards
    expected = [cards, [], :hit]
    player.reset
    assert_equal(expected, [original, player.cards, player.status])
  end
end