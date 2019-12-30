require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

What could you add to this class to simplify it and remove two methods
from the class definition while still maintaining the same functionality?

class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} type of Bees Wax"
  end
end
=end

class BeesWax
  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    "I am a #{type} type of Bees Wax"
  end
end

class QuestionFourTest < Minitest::Test
  attr_accessor :beeswax

  def setup
    @beeswax = BeesWax.new("yellow")
  end

  def test_1
    assert_equal("yellow", beeswax.type)
  end

  def test_2
    beeswax.type = "absolute"
    assert_equal("absolute", beeswax.type)
  end

  def test_3
    assert_equal("I am a yellow type of Bees Wax", beeswax.describe_type)
  end
end