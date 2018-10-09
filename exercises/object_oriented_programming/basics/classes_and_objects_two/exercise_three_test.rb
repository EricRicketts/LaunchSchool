require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identity
    self
  end
end

class ExerciseThreeTest < Minitest::Test
  def test_one
    kitty = Cat.new('Sophie')
    assert_match(/#<Cat:.+\s+@name=\"Sophie\">/, kitty.identity.inspect)
  end
end