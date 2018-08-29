require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/human'
require_relative '../lib/computer'

class HumanComputerMovesTest < Minitest::Test

  attr_accessor :computer, :human

  def setup
    @computer = Computer.new
    @human = Human.allocate
  end

  def test_computer_beats_human
    # skip
    computer.move = Move.new(Rock.new)
    human.move = Move.new(Scissors.new)
    assert(computer.move > human.move)
  end

  def test_human_beats_computer
    # skip
    computer.move = Move.new(Lizard.new)
    human.move = Move.new(Scissors.new)
    assert(human.move > computer.move)
  end

  def test_computer_loses_to_human
    # skip
    computer.move = Move.new(Paper.new)
    human.move = Move.new(Lizard.new)
    assert(computer.move < human.move)
  end

  def test_human_loses_to_computer
    # skip
    computer.move = Move.new(Paper.new)
    human.move = Move.new(Spock.new)
    assert(human.move < computer.move)
  end

  def test_computer_and_human_tie
    # skip
    computer.move = Move.new(Spock.new)
    human.move = Move.new(Spock.new)
    assert(computer.move == human.move)
  end

end