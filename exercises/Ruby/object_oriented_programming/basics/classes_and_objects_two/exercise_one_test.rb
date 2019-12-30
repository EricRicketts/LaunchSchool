require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  def self.generic_greeting
    "Hello!  I am a cat!"
  end
end

class ExerciseOneTest < Minitest::Test
  def test_one
    binding.pry
    assert_equal("Hello!  I am a cat!", Cat.generic_greeting)
  end
end