require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/move'

class MoveBasicsTest < Minitest::Test
  attr_accessor :move

  def setup
    @move = Move.new(Rock.new)
  end

  def test_move_class
    # skip
    assert_instance_of(Move, @move)
  end

  def test_selection_attribute
    # skip
    assert_respond_to(@move, :selection)
  end

  def test_current_selection
    # skip
    assert_instance_of(Rock, move.selection)
  end

  def test_output
    # skip
    assert("Rock", "#{move}")
  end
end
