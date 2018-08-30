require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib/rps_game'

class RpsGamePlayTest < Minitest::Test
  attr_accessor :game, :io

  def setup
    @io = StringIO.new
    io.string = "Foo\n"
    $stdin = io
    out, err = capture_io do
      @game = RPSGame.new
    end
    assert_instance_of(String, out)
    assert_empty(err)
  end

  def teardown
    io.rewind
    $stdin = STDIN
  end

  def test_play_round
    # skip
    first_str = "Please choose rock, paper, scissors, lizard, or spock:\n"
    tie_str = "It is a tie!\n"
    human_str = "Foo won!\n"
    computer_str = "#{game.computer.name} won!\n"
    io.string = "rock\n"
    out, err = capture_io do
      puts game.play_round
    end
    results = [first_str + tie_str, first_str + human_str,
      first_str + computer_str]
    assert_empty(err)
    assert(results.any? { |result| result == out })
  end

  def test_play_another_game
    # skip
    io.string = "n\n"
    result = ''
    expected = "Would you like to play again? (y/n)\n"
    out, err = capture_io do
      result = game.play_again?
    end
    assert_equal(expected, out)
    assert_empty(err)
    refute(result)
  end

  def test_play_another_game_bad_input
    # skip
    io.string = "foo\nY\n"
    result = ''
    expected = "Would you like to play again? (y/n)\n" +
      "Sorry, must be y or n.\n" + "Would you like to play again? (y/n)\n"
    out, err = capture_io do
      result = game.play_again?
    end
    assert_equal(expected, out)
    assert_empty(err)
    assert(result)
  end
end