require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

What is used in this class but doesn't add any value?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
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

    def information
      "brightness level is #{brightness}\n"\
      "color is #{color}"
    end
  end

  def test_1
    # original information is useless, as the information presented
    # may not match the state of the object.  Also the information method
    # is at the class level so it cannot speak for the state of each
    # Light object.
    light = Light.new('high', 'green')
    expected = "brightness level is high\ncolor is green"
    assert_equal(expected, light.information)
  end

end
