require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello!  My name is #{@name}!"
  end
end

class ExerciseSixTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    assert_output(/Hello!  My name is Sophie!/) { kitty.greet }
  end
end