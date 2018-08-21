require 'stringio'
require 'o_stream_catcher'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../player'

class PlayerTest < Minitest::Test

  def setup
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def test_computer_move
    # skip
    assert(['rock', 'paper', 'scissors'].include?(@computer.choose))
  end

  def test_correct_human_move
    # skip
    string_io = StringIO.new
    string_io.puts "rock"
    string_io.rewind
    $stdin = string_io

    result, stdout, stderr = OStreamCatcher.catch do
      @human.choose
    end 
    $stdin = STDIN

    expected = ["Please choose rock, paper, or scissors:\n", "rock"]
    assert_equal(expected, [stdout, result])   
  end

end