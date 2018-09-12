require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

If we have a class such as the one below:

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

In the name of the cats_count method we have used self.
What does self refer to in this context?
=end

class Cat
  @@cats_count = 0

  def self.cats_count
    @@cats_count
  end

  def self.self_is
    self
  end

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end
end

class QuestionNineTest < Minitest::Test
  # when used outside of an instance method
  # self refers to the class
  def test_1
    assert_equal(Cat, Cat.self_is)
  end
end