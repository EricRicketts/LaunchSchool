require 'pry-byebug'

class Game
  TEN = 10
  ZERO = 0
  LAST_FRAME = 9

  attr_accessor :frames, :current_frame, :current_frame_index

  def initialize
    @frames = setup_frames
    @current_frame_index = 0
    @current_frame = frames[current_frame_index]
  end

  def roll(pins)
    record_throw(pins)
  end

  private

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
    current_frame_index == LAST_FRAME
  end

  def next_frame
    self.current_frame_index += 1
    frames[current_frame_index]
  end

  def record_throw(pins)
    first_throw? ? tally_first_throw(pins) : tally_second_throw(pins)
  end


  def setup_frames
    frame = Struct.new(:throw1, :throw2, :score, :state, keyword_init: nil)
    frames = (1..9).map { |_| frame.new }
    frames.push(Struct.new(*frame.new.to_h.keys, :throw3, keyword_init: nil).new)
  end

  def tally_first_throw(pins)
    is_strike?(pins) ? tally_strike(pins) : current_frame.throw1 = pins
  end

  def tally_open_frame(pins)
    current_frame.throw2 = pins
    current_frame.state = :open
  end

  def tally_second_throw(pins)
    is_spare?(pins) ? tally_spare(pins) : tally_open_frame(pins)
    self.current_frame = next_frame
  end

  def tally_spare(pins)
    current_frame.throw2 = pins
    current_frame.state = :spare
  end

  def tally_strike(pins)
    current_frame.throw1 = pins
    current_frame.throw2 = ZERO
    current_frame.state = :strike
    self.current_frame = next_frame
  end
end
