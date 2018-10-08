require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  def initialize(name)
    @name = name
    puts "Hello!  My name is #{@name}!"
  end
end

class ExerciseFiveTest < Minitest::Test
  def test_one
    assert_output(/Hello!  My name is Sophie!/) { kitty = Cat.new('Sophie') }
  end
end