require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem statement

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

Explain what the @@cats_count variable does and how it works
What code would you need to write to test your theory?
=end

class Cat
  @@cats_count = 0

  def self.cats_count
    @@cats_count
  end

  def self.reset
    @@cats_count = 0
  end

  def initialize(type)
    @type = type
    @age = 0
    @@cats_count += 1
  end
end

class QuestionSevenTest < Minitest::Test

  # @@cats_count is a class variable which means
  # it is scoped at the class level so any instance
  # of cat can access this variable.  In this case
  # this class variable is used to keep track of how
  # many cat instances we have created, as the class
  # variable gets incremented every time a new instance
  # of Cat is created.
  def test_1
    initial_number = Cat.cats_count
    cat1 = Cat.new("Persian")
    cat2 = Cat.new("Siamese")
    current_number = Cat.cats_count
    assert(initial_number.zero? && 2 == current_number)
  end
end