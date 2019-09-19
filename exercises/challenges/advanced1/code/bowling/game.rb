require 'pry-byebug'
require_relative './frames'

class Game
  TEN = 10
  ZERO = 0
  LAST_FRAME = 9
  FIRST_THROW = Proc.new { |throw1, throw2| throw1.nil? && throw2.nil? }
  SECOND_THROW = Proc.new { |throw1, throw2| throw1.integer? && throw2.nil? }
  FINALT_THROW = Proc.new do |throw1, throw2, frame_state|
    throw1.integer? && throw2.integer? && [:strike, :spare].include?(frame_state)
  end

  attr_accessor :frames, :current_frame, :game_complete

  def initialize
    @frames = setup_frames
    @current_frame = @frames.first
    @game_complete = false
  end

  def roll(pins)
    last_frame? ? record_last_frame(pins) : record_throw(pins)
  end

  private

  def complete_frame(pins, state)
    current_frame.throw2 = pins
    current_frame.state = state
  end

  def is_spare?(pins)
    current_frame.throw1 + pins == TEN
  end

  def is_strike?(pins)
    pins == TEN && current_frame.throw1.nil?
  end

  def first_throw?
    current_frame.throw1.nil?
  end

  def last_frame?
    frames.index(current_frame) == LAST_FRAME
  end

  def last_frame_is_open(pins)
    current_frame.state = :open
    self.game_complete = true
  end

  def next_frame
    idx = frames.index(self.current_frame)
    self.current_frame = frames[idx + 1]
  end

  def over?
    game_complete
  end

  def record_last_frame(pins)
    throws_and_state = [current_frame.throw1, current_frame.throw2, current_frame.state]
    case throws_and_state
    when FIRST_THROW then tally_first_throw_last_frame(pins)
    when SECOND_THROW then tally_second_throw_last_frame(pins)
    when FINAL_THROW then tally_final_throw_last_frame(pins)
    end
  end

  def record_throw(pins)
    first_throw? ? tally_first_throw(pins) : tally_second_throw(pins)
  end

  def setup_frames
    frames = (1..9).map { |_| Frames::Frame.new }
    frames << Frames::LastFrame.new
  end

  def tally_first_throw(pins)
    is_strike?(pins) ? tally_strike(pins) : current_frame.throw1 = pins
  end

  def tally_final_throw_last_frame(pins)
    current_frame.throw3 = pins
    self.game_complete = true
  end

  def tally_first_throw_last_frame(pins)
    current_frame.state = :strike if is_strike?(pins)
    current_frame.throw1 = pins
  end

  def tally_second_throw(pins)
    is_spare?(pins) ? complete_frame(pins, :spare) : complete_frame(pins, :open)
    current_frame = next_frame
  end

  def tally_second_throw_last_frame(pins)
    if current_frame.throw1 + pins < TEN
      last_frame_is_open(pins)
    elsif current_frame.throw1 + pins == TEN
      current_frame.state = :spare
    end
    current_frame.throw2 = pins
  end

  def tally_strike(pins)
    current_frame.throw1 = pins
    complete_frame(ZERO, :strike)
    current_frame = next_frame
  end
end