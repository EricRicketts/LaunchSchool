require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/playable.rb'

class TestPlayable < Minitest::Test
  include Playable

  def test_initialize_game
    player_hand, player_tally, dealer_hand, dealer_tally = initialize_game
    assert({ player: 0 } == player_tally && { dealer: 0 } == dealer_tally)
    assert(2 == player_hand.size && 2 == dealer_hand.size)
    assert(player_hand.is_a?(Hash) && dealer_hand.is_a?(Hash))
  end



end
