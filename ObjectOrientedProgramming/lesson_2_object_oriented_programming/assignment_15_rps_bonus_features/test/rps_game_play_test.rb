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
    assert(results.any? { |result| result == out })
  end
end