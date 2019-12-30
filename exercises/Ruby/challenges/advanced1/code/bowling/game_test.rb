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
    assert_equal(0, game.current_frame_index)
  end

  def test_simple_open_frame_second_roll
    # skip
    expected_throws = [4, 3]
    game.roll(4)
    game.roll(3)

    frame = game.frames.first
    resulting_throws = [frame.throw1, frame.throw2]

    assert_equal(1, game.current_frame_index)
    assert_equal(expected_throws, resulting_throws)
    assert_equal(:open, frame.state)
  end

  def test_frame_strike
    # skip
    expected_throws = [10, 0]
    game.roll(10)

    frame = game.frames.first
    resulting_throws = [frame.throw1, frame.throw2]

    assert_equal(1, game.current_frame_index)
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

    assert_equal(1, game.current_frame_index)
    assert_equal(expected_throws, resulting_throws)
    assert_equal(:spare, frame.state)
  end

  def test_not_at_last_frame
    # skip
    roll_n_times(16, 1)
    refute(game.send(:last_frame?))
  end

  def test_at_last_frame
    # skip
    roll_n_times(18, 1)
    assert(game.send(:last_frame?))
  end

  def test_game_complete_last_frame_open
    # skip
    expected_throws = [4, 1]

    roll_n_times(18, 1)
    game.roll(4)
    game.roll(1)

    resulting_throws = [game.current_frame.throw1, game.current_frame.throw2]

    assert_equal(:open, game.current_frame.state)
    assert_equal(expected_throws, resulting_throws)
    assert(game.send(:over?))
  end

  def test_game_complete_spare_need_last_fill
    # skip
    expected_throws = [6, 4, 8]

    roll_n_times(18, 1)
    game.roll(6)
    game.roll(4)
    game.roll(8)

    resulting_throws = [game.current_frame.throw1, game.current_frame.throw2, game.current_frame.throw3]

    assert_equal(:spare, game.current_frame.state)
    assert_equal(expected_throws, resulting_throws)
    assert(game.send(:over?))
  end

  def test_game_complete_strike_need_last_fill
    # skip
    expected_throws = [10, 10, 8]

    roll_n_times(18, 1)
    game.roll(10)
    game.roll(10)
    game.roll(8)

    resulting_throws = [game.current_frame.throw1, game.current_frame.throw2, game.current_frame.throw3]

    assert_equal(:strike, game.current_frame.state)
    assert_equal(expected_throws, resulting_throws)
    assert(game.send(:over?))
  end

  def test_should_be_able_to_score_open_frame
    # skip
    @game.roll(3)
    @game.roll(4)
    roll_n_times(18, 0)
    assert_equal 7, @game.score
  end

  def test_should_be_able_to_score_multiple_frames
    # skip
    [3, 4, 2, 3, 5, 2].each do |pins|
      @game.roll pins
    end
    roll_n_times(14, 0)
    assert_equal 19, @game.score
  end

  def test_should_score_a_game_with_all_gutterballs
    # skip
    roll_n_times(20, 0)
    assert_equal 0, @game.score
  end

    def test_should_score_a_game_with_all_single_pin_rolls
    # skip
    roll_n_times(20, 1)
    assert_equal 20, @game.score
  end

  def test_should_allow_game_with_all_open_frames
    # skip
    roll_n_times(10, [3, 6])
    assert_equal 90, @game.score
  end

  def test_should_correctly_score_a_strike_that_is_not_on_the_last_frame
    # skip
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    roll_n_times(16, 0)

    assert_equal 26, @game.score
  end

  def test_should_score_a_spare_that_is_not_on_the_last_frame
    # skip
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(4)
    roll_n_times(16, 0)

    assert_equal 20, @game.score
  end

  def test_should_score_multiple_strikes_in_a_row
    # skip
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)
    @game.roll(5)
    @game.roll(3)
    roll_n_times(12, 0)

    assert_equal 81, @game.score
  end

    def test_should_score_multiple_spares_in_a_row
    # skip
    @game.roll(5)
    @game.roll(5)
    @game.roll(3)
    @game.roll(7)
    @game.roll(4)
    @game.roll(1)
    roll_n_times(14, 0)

    assert_equal 32, @game.score
  end

  def test_should_allow_fill_balls_when_the_final_frame_is_strike
    # skip
    roll_n_times(18, 0)
    @game.roll(10)
    @game.roll(7)
    @game.roll(1)

    assert_equal 18, @game.score
  end

  def test_should_allow_fill_ball_in_last_frame_if_spare
    # skip
    roll_n_times(18, 0)
    @game.roll(9)
    @game.roll(1)
    @game.roll(7)

    assert_equal 17, @game.score
  end

  def test_should_allow_fill_balls_to_be_strike
    # skip
    roll_n_times(18, 0)
    @game.roll(10)
    @game.roll(10)
    @game.roll(10)

    assert_equal 30, @game.score
  end

  def test_should_score_a_perfect_game
    # skip
    roll_n_times(12, 10)
    assert_equal 300, @game.score
  end

  def test_should_not_allow_rolls_with_negative_pins
    # skip
    assert_raises(
      RuntimeError,
      'Pins must have a value from 0 to 10') do
        @game.roll(-1)
      end
  end

  def test_should_not_allow_rolls_better_than_strike
    # skip
    assert_raises(
      RuntimeError,
      'Pins must have a value from 0 to 10') do
        @game.roll(11)
      end
  end

  def test_should_not_allow_two_normal_rolls_better_than_strike
    # skip
    assert_raises RuntimeError, 'Pin count exceeds pins on the lane' do
      @game.roll(5)
      @game.roll(6)
    end
  end

  def test_should_not_allow_two_normal_rolls_better_than_strike_in_last_frame
    # skip
    roll_n_times(18, 0)
    assert_raises RuntimeError, 'Pin count exceeds pins on the lane' do
      @game.roll(10)
      @game.roll(5)
      @game.roll(6)
    end
  end

  def test_should_not_allow_to_take_score_at_the_beginning
    # skip
    assert_raises(
      RuntimeError,
      'Score cannot be taken until the end of the game',
    ) do
      @game.score
    end
  end

  def test_should_not_allow_to_take_score_before_game_has_ended
    # skip
    roll_n_times(19, 5)
    assert_raises(
      RuntimeError,
      'Score cannot be taken until the end of the game') do
        @game.score
      end
  end

  def test_should_not_allow_rolls_after_the_tenth_frame
    # skip
    roll_n_times(20, 0)
    assert_raises(
      RuntimeError,
      'Should not be able to roll after game is over',
    ) do
      @game.roll(0)
    end
  end

  def test_should_not_calculate_score_before_fill_balls_have_been_played
    # skip
    roll_n_times(10, 10)

    assert_raises RuntimeError, 'Game is not yet over, cannot score!' do
      @game.score
    end
  end


  def roll_n_times(rolls, pins)
    rolls.times do
      Array(pins).each { |value| game.roll(value) }
    end
  end
  private :roll_n_times
end
