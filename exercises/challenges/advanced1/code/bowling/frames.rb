module Frames

  class Frame
    attr_accessor :throw1, :throw2, :score, :state
  end

  class LastFrame < Frame
    attr_accessor :throw3
  end
end