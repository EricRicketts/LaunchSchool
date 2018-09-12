require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement:

Which of these two classes has an instance variable and how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end
=end

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

class QuestionFiveTest < Minitest::Test
  attr_accessor :fruit, :pizza

  # Only the Pizza class has an instance variable.
  # This is because instance variables are prefixed
  # with a '@', so the instance variable @name was
  # set in the Pizza constructor.  In the Fruit
  # construction only a local variable 'name' was set.

  def setup
    @fruit = Fruit.new("Orange")
    @pizza = Pizza.new("Sausage and Pepperoni")
  end

  def test_1
    assert(fruit.instance_variables.empty?)
  end

  def test_2
    assert_equal([:@name], pizza.instance_variables)
  end
end