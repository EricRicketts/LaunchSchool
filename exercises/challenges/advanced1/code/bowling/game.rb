require 'pry-byebug'
require_relative './frames'

class Game
  TEN = 10
  ZERO = 0
  LAST_FRAME = 9

  attr_accessor :frames, :current_frame

  def initialize
    @frames = setup_frames
    @current_frame = @frames.first
  end

  def roll(pins)
    record_throw(pins)
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
    pins == TEN
  end

  def first_throw?
    current_frame.throw1.nil?
  end

  def last_frame?
    frames.index(current_frame) == LAST_FRAME
  end

  def next_frame
    idx = frames.index(self.current_frame)
    self.current_frame = frames[idx + 1]
  end

  def record_throw(pins)
    first_throw? ? tally_first_throw(pins) : tally_second_throw(pins)
  end

  def setup_frames
    frames = (1..9).map { |_| Frames::GenericFrame.new }
    frames << Frames::LastFrame.new
  end

  def tally_first_throw(pins)
    is_strike?(pins) ? tally_strike(pins) : current_frame.throw1 = pins
  end

  def tally_second_throw(pins)
    is_spare?(pins) ? complete_frame(pins, :spare) : complete_frame(pins, :open)
    current_frame = next_frame
  end

  def tally_strike(pins)
    current_frame.throw1 = pins
    complete_frame(ZERO, :strike)
    current_frame = next_frame
  end
end