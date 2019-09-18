require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative './game'

class GameTest < Minitest::Test
  attr_accessor :game

  def setup
    @game = Game.new
  end

  def test_number_of_frames
    # skip
    assert_equal(10, game.frames.count)
  end

  def test_simple_open_frame_first_roll
    # skip
    game.roll(5)
    assert_equal(5, game.current_frame.throw1)
    assert_equal(0, game.frames.index(game.current_frame))
  end

  def test_simple_open_frame_second_roll
    # skip
    expected_throws = [4, 3]
    game.roll(4)
    game.roll(3)

    frame = game.frames.first
    resulting_throws = [frame.throw1, frame.throw2]

    assert_equal(1, game.frames.index(game.current_frame))
    assert_equal(expected_throws, resulting_throws)
    assert_equal(:open, frame.state)
  end

  def test_frame_strike
    # skip
    expected_throws = [10, 0]
    game.roll(10)

    frame = game.frames.first
    resulting_throws = [frame.throw1, frame.throw2]

    assert_equal(1, game.frames.index(game.current_frame))
    assert_equal(expected_throws, resulting_throws)
    assert_equal(:strike, frame.state)
  end

  def test_frame_spare
    # skip
    expected_throws = [4, 6]
    game.roll(4)
    game.roll(6)

    frame = game.frames.first
    resulting_throws = [frame.throw1, frame.throw2]

    assert_equal(1, game.frames.index(game.current_frame))
    assert_equal(expected_throws, resulting_throws)
    assert_equal(:spare, frame.state)
  end

  def test_not_at_last_frame
    roll_n_times(16, 1)
    refute(game.send(:last_frame?))
  end

  def test_at_last_frame
    roll_n_times(18, 1)
    assert(game.send(:last_frame?))
  end

  def roll_n_times(rolls, pins)
    rolls.times do
      Array(pins).each { |value| game.roll(value) }
    end
  end
  private :roll_n_times
end