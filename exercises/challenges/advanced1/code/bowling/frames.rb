module Frames

  class Frame
    attr_accessor :throw1, :throw2, :score
  end

  class GenericFrame < Frame
    attr_accessor :state
  end

  class LastFrame < Frame
    attr_accessor :throw3
  end
end