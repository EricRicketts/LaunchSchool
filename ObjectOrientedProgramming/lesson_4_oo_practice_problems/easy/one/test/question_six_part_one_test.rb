require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

What could we add to the class below to access the instance variable @volume?

class Cube
  def initialize(volume)
    @volume = volume
  end
end
=end

class Cube
  def initialize(volume)
    @volume = volume
  end
end

# the access @volume we can define an
# explicit getter method
class Cube
  def get_volume
    @volume
  end
end

class QuestionSixTestPartOne < Minitest::Test
  attr_accessor :cube

  def setup
    @cube = Cube.new(100)
  end

  def test_1
    assert_equal(100, cube.get_volume)
  end
end