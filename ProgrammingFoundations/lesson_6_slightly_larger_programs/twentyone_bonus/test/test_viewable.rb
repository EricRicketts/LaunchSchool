require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../app/viewable.rb'

class TestViewable < Minitest::Test
  include Viewable

  def test_game_tally
    game_tally = { player: 1, dealer: 0 }
    expected = "=> Current tally:  Player 1, Dealer 0.\n"
    assert_output(expected) { display_game_tally(game_tally) }
  end

  def test_display_score
    expected = "=> Dealer score is: 13\n"
    assert_output(expected) { display_one_score("Dealer", 13) }
  end

end
