require 'pry-byebug'
require_relative './error_checks'

class Game
  include ErrorChecks

  TEN = 10
  ZERO = 0
  FIRST_FRAME = 0
  LAST_FRAME = 9
  NINTH_FRAME = 8
  EIGHTH_FRAME = 7

  attr_accessor :frames, :current_frame, :current_frame_index

  def initialize
    @frames = setup_frames
    @current_frame_index = 0
    @current_frame = frames[current_frame_index]
  end

  def roll(pins)
    invalid_throw?(pins)
    invalid_frame?(pins)
    record_throw(pins)
  end

  def score
    frames.each.with_index do |frame, idx|
      idx == LAST_FRAME ? score_last_frame(idx) : score_frame(frame, idx)
    end.sum(&:score)
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

  def frames_done?
    (0..9).all? do |idx|
      frame = frames[idx]
      !!frame.throw1 && !!frame.throw2 && !!frame.state
    end
  end

  def last_frame?
    current_frame_index == LAST_FRAME
  end

  def last_frame_done?
    frame = frames[LAST_FRAME]
    !!frame.throw1 && !!frame.throw2 &&
    !!frame.throw3 && !!frame.state
  end

  def next_frame
    self.current_frame_index += 1
    frames[current_frame_index]
  end

  def over?
    frames_done? && last_frame_done?
  end

  def record_throw(pins)
    if last_frame? && first_throw?
      tally_first_throw_last_frame(pins)
    elsif last_frame? && !first_throw?
      tally_additional_throws_last_frame(pins)
    else
      first_throw? ? tally_first_throw(pins) : tally_second_throw(pins)
    end
  end

  def score_frame(frame, idx)
    frame_state = frame.state
    case frame_state
    when :open then score_open(frame)
    when :spare then score_spare(frame, idx)
    when :strike then score_strike(frame, idx)
    end
  end

  def score_last_frame(idx)
    last_frame = frames[idx]
    last_frame.score = last_frame.throw1 + last_frame.throw2 + last_frame.throw3
  end

  def score_open(frame)
    frame.score = sum_throws(frame)
  end

  def score_spare(frame, idx)
    frame_next_first_throw = frames[idx + 1].throw1
    frame.score = sum_throws(frame) + frame_next_first_throw
  end

  def score_strike(frame, idx)
    frame_next = frames[idx + 1]
    if idx <= EIGHTH_FRAME && frame_next.state == :strike
      frame_after_next = frames[idx + 2]
      frame.score = sum_throws(frame) + sum_throws(frame_next) + frame_after_next.throw1
    else
      frame.score = sum_throws(frame) + sum_throws(frame_next)
    end
  end

  def setup_frames
    frame = Struct.new(:throw1, :throw2, :score, :state, keyword_init: nil)
    frames = (1..9).map { |_| frame.new }
    frames.push(Struct.new(*frame.new.to_h.keys, :throw3, keyword_init: nil).new)
  end

  def sum_throws(frame)
    frame.throw1 + frame.throw2
  end

  def tally_additional_throws_last_frame(pins)
    if current_frame.throw2.nil?
      tally_second_throw_last_frame(pins)
    elsif [:strike, :spare].include?(current_frame.state)
      current_frame.throw3 = pins
    end
  end

  def tally_first_throw(pins)
    is_strike?(pins) ? tally_strike(pins) : current_frame.throw1 = pins
  end

  def tally_first_throw_last_frame(pins)
    current_frame.state = :strike if is_strike?(pins)
    current_frame.throw1 = pins
  end

  def tally_open_frame(pins)
    current_frame.throw2 = pins
    current_frame.state = :open
  end

  def tally_second_throw(pins)
    is_spare?(pins) ? tally_spare(pins) : tally_open_frame(pins)
    self.current_frame = next_frame
  end

  def tally_second_throw_last_frame(pins)
    pin_count_two_frames = current_frame.throw1 + pins
    case pin_count_two_frames
    when (0..9)
      current_frame.state = :open
      current_frame.throw3 = 0
    when 10
      current_frame.state = :spare
    end
    current_frame.throw2 = pins
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
