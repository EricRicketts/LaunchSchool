require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/rps_game'

class RpsGameStartTest < Minitest::Test
  attr_accessor :game, :io

  def setup
    @io = StringIO.new
    io.string = "Foo\n"
    $stdin = io
    out, err = capture_io do
      @game = RPSGame.new
    end
    expected = "Please enter your name: \n"
    assert_equal(expected, out)
    assert_empty(err)
  end

  def teardown
    io.rewind
    $stdin = STDIN
  end

  def test_history_attribute
    # skip
    assert_instance_of(History, game.history)
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

  def test_welcome_message
    # skip
    expected = "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    assert_equal(expected, game.welcome)
  end

  def test_goodbye_message
    # skip
    expected = "Thanks for playing Rock, Paper, Scissors, Lizard, Spock!  Goodbye!"
    assert_equal(expected, game.goodbye)
  end
end