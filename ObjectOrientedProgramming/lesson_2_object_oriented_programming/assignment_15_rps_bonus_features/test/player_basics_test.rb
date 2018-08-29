require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/player'

class TestPlayerBasics < Minitest::Test
  attr_reader :player

  def setup
    @player = Player.allocate
  end

  def test_default
    # skip
    assert(player.is_a?(Player))
  end

  def test_name_attr
    # skip
    assert(player.respond_to?(:name))
  end

  def test_move_attr
    # skip
    assert(player.respond_to?(:move))
  end

  def test_tally_attr
    # skip
    assert(player.respond_to?(:tally))
  end
end