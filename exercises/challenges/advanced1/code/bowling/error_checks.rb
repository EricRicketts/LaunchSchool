module ErrorChecks

  class InvalidThrowError < RuntimeError
    def initialize(msg = "Pins must have a value from 0 to 10")
      super(msg)
    end
  end

  class PrematureScoringError < RuntimeError
    def initialize(msg = 'Score cannot be taken until the end of the game')
      super(msg)
    end
  end

  def too_many_throws?(pins)
    msg = 'Should not be able to roll after game is over'
    raise InvalidThrowError.new(msg) if over?
    false
  end

  def check_generic_frame(pins, msg)
    frame_count = current_frame.throw1 + pins
    raise InvalidThrowError.new(msg) if frame_count > 10
    false
  end

  def check_last_frame(pins, msg)
    if current_frame.throw1 < 10 && current_frame.state != :spare
      raise InvalidThrowError.new(msg) if current_frame.throw1 + pins > 10
    elsif current_frame.state == :strike && !current_frame.throw2.nil? && current_frame.throw2 < 10
      raise InvalidThrowError.new(msg) if current_frame.throw2 + pins > 10
    else
      false
    end
  end

  def invalid_throw?(pins)
    raise InvalidThrowError.new unless (0..10).include?(pins)
  end

  def invalid_frame?(pins)
    return false if current_frame.throw1.nil?
    msg = 'Pin count exceeds pins on the lane'

    last_frame? ? check_last_frame(pins, msg) : check_generic_frame(pins, msg)
  end

  def near_perfect_game?
    msg = 'Game is not yet over, cannot score!'
    all_strikes_before_last_frame = (0..8).all? { |idx| frames[idx].state == :strike }
    last_frame_first_throw_strike = (frames[9].throw1 == 10)
    fill_status = (frames[9].throw2.nil? || frames[9].throw3.nil?)
    not_finished = all_strikes_before_last_frame && last_frame_first_throw_strike && fill_status
    raise PrematureScoringError.new(msg) if not_finished
    false
  end

  def score_before_game_over?
    raise PrematureScoringError.new unless over?
    false
  end
end
