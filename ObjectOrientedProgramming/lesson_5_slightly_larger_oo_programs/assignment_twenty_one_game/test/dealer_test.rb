require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/dealer'

class DealerTest < Minitest::Test
  attr_accessor :dealer

  def setup
    @dealer = Dealer.new
  end

  def test_name
    assert_equal("Dealer", dealer.name)
  end

  def test_remaining_attributes
    expected = [[], :hit, true]
    actual = [dealer.cards, dealer.status, dealer.deck.is_a?(Deck)]
    assert_equal(expected, actual)
  end
end