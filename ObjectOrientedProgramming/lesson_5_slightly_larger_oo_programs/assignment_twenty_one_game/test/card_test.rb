require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../lib/card'

class CardTest < Minitest::Test
  attr_accessor :card

  def setup
    @card = Card.new("Spades", "King")
  end

  def test_suit
    original = card.suit
    card.suit = "Hearts"
    expected = %w(Spades Hearts)
    assert_equal(expected, [original, card.suit])
  end

  def test_rank
    original = card.rank
    card.rank = "10"
    expected = %w(King 10)
    assert_equal(expected, [original, card.rank])
  end

  def test_value
    original = card.value
    card.value = 10
    expected = [0, 10]
    assert_equal(expected, [original, card.value])
  end

  def test_face_down
    original = card.face_down
    card.face_down = true
    expected = [false, true]
    assert_equal(expected, [original, card.face_down])
  end

  def test_normal_to_s
    assert_equal("KS", card.to_s)
  end

  def test_10_card_to_s
    card = Card.new("Hearts", "10")
    assert_equal("10H", card.to_s)
  end
end