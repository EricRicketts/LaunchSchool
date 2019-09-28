module ErrorChecks

class InvalidThrowError < RuntimeError
    def initialize(msg="Pins must have a value from 0 to 10")
      super(msg)
    end
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
end
