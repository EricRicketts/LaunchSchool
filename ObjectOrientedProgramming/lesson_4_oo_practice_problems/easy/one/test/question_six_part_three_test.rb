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

# to access @volume without attr_ or a
# defined accessor method use #instance_variable_get

class QuestionSixTestPartThree < Minitest::Test
  attr_accessor :cube

  def setup
    @cube = Cube.new(100)
  end

  def test_1
    assert_equal(100, cube.instance_variable_get("@volume"))
  end
end