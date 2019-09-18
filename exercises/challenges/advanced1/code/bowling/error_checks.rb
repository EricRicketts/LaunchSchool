module ErrorChecks

  class InvalidNumberOfPinsError < RuntimeError
    def initialize(msg="Pins must have a value from 0 to 10")
      super(msg)
    end
  end

  def invalid_number_of_pins?(pins)
    raise InvalidNumberOfPinsError.new unless (0..10).include?(pins)  
  end
end
