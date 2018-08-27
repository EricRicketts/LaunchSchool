require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/move'

class MoveEqualToTest < Minitest::Test
  attr_reader :move_rock, :move_paper, :move_scissors,
    :move_lizard, :move_spock

  def setup
    @move_rock = Move.new(Rock.new)
    @move_paper = Move.new(Paper.new)
    @move_scissors = Move.new(Scissors.new)
    @move_lizard = Move.new(Lizard.new)
    @move_spock = Move.new(Spock.new)
  end

  def test_rock
    # skip
    assert(move_rock == move_rock)
  end

  def test_paper
    # skip
    assert(move_paper == move_paper)
  end

  def test_scissors
    # skip
    assert(move_scissors == move_scissors)
  end

  def test_lizard
    # skip
    assert(move_lizard == move_lizard)
  end

  def test_spock
    # skip
    assert(move_spock == move_spock)
  end
end
