require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/rpsclsp_game'

class RPScLSpGameBasicsTest < Minitest::Test
  attr_accessor :game, :io

  def setup
    @io = StringIO.new
    io.string = "Foo\n"
    $stdin = io
    out, err = capture_io do
      @game = RPScLSpGame.new
    end
    expected = "Please enter your name: \n"
    assert_equal(expected, out)
    assert_empty(err)
  end

  def teardown
    io.rewind
    $stdin = STDIN
  end

  def test_history_init
    # skip
    expected = [
      :round, :human_move, :computer_move,
      :winner, :human_tally, :computer_tally
    ]
    assert_equal(expected, game.history.keys)
  end

  def test_computer_player_exists
    # skip
    assert_instance_of(Computer, game.computer)
    assert_includes(Computer::NAMES, game.computer.name)
  end

  def test_human_player_exists
    # skip
    assert_instance_of(Human, game.human)
    assert_equal("Foo", game.human.name)
  end

  def test_table_init
    # skip
    computer_name = game.computer.name
    expected = %W(Round Foo #{computer_name} Winner Foo\sTally #{computer_name}\sTally)
    assert_equal(expected, game.table.columns)
  end
end