require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

If we have the class below, what would you need to call
to create a new instance of this class.

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end
=end

class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

class QuestionTenTest < Minitest::Test

  # in creating an instance of class Bag, the constructor
  # is required to have 2 agruments
  def test_1
    assert_instance_of(Bag, Bag.new("green", "wool"))
  end

  def test_2
    assert_raises(ArgumentError) { Bag.new }
  end
end