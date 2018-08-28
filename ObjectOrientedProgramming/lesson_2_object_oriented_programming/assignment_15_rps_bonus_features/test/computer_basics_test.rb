require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/computer'

class ComputerBasicsTest < Minitest::Test
  attr_accessor :computer

  def setup
    @computer = Computer.new
  end

  def test_computer_tally
    # skip
    assert(computer.tally.zero?)
  end

  def test_computer_name
    # skip
    computer_names = Computer::NAMES
    assert_includes(computer_names, computer.name)
  end

  def test_computer_move
    # skip
    moves = Rules::MOVES
    computer.choose
    assert_includes(moves, computer.move.selection.class)
  end
end