require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

How could you change the method name below so that the method name is more clear and less repetitive.

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.light_information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end
=end

class QuestionSevenTest < Minitest::Test
  class Light
    attr_accessor :brightness, :color

    def initialize(brightness, color)
      @brightness = brightness
      @color = color
    end

    def self.desired_lighting
      "I want to turn on the light with a brightness level of super high and a colour of green"
    end
  end

  def test_1
    # I was reading too much into the problem we repeat the class name in this class method, though
    # I think my class method name does reveal intent quite well.  However, LS wanted me to eliminate
    # the "light_" from the method name as it does not read well, Light.information would read better
    # so they wanted to renamed to ::information
    expected = "I want to turn on the light with a brightness level of super high and a colour of green"
    assert_equal(expected, Light.desired_lighting)
  end
end
