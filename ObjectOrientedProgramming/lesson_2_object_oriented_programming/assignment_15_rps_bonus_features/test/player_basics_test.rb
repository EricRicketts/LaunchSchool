require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/player'

class TestPlayerBasics < Minitest::Test
  attr_reader :player

  def setup
    @player = Player.new
  end

  def test_default
    assert(player.is_a?(Player))
  end

  def test_name_attr
    assert(player.respond_to?(:name))
  end

  def test_move_attr
    assert(player.respond_to?(:move))
  end

  def test_tally_attr
    assert(player.respond_to?(:tally))
  end

  def test_tally_init
    assert_equal(0, player.tally)
  end
end
