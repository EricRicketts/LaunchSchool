require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/move'

class MoveGreaterThanTest < Minitest::Test
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
    results = [move_rock > move_scissors, move_rock > move_lizard]
    assert(results.all?)
  end

  def test_paper
    # skip
    results = [move_paper > move_rock, move_paper > move_spock]
    assert(results.all?)
  end

  def test_scissors
    # skip
    results = [move_scissors > move_paper, move_scissors > move_lizard]
    assert(results.all?)
  end

  def test_lizard
    # skip
    results = [move_lizard > move_paper, move_lizard > move_spock]
    assert(results.all?)
  end

  def test_spock
    # skip
    results = [move_spock > move_rock, move_spock > move_scissors]
    assert(results.all?)
  end
end
