require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem statement

If I have the following class:

class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

Which one of these is a class method (if any)
and how do you know? How would you call a class method?
=end

class Television
  def self.manufacturer
    "Samsung"
  end

  def initialize(model)
    @model = model
  end

  def model
    @model
  end
end

class QuestionSixTest < Minitest::Test
  attr_accessor :tele1, :tele2

  def setup
    @tele1 = Television.new("QN75Q7F")
    @tele2 = Television.new("QN65Q7FAMFXZA")
  end

  def test_1
    # self.manufacturer is a class method because
    # the method name is prefixed with 'self' or it
    # can be prefixed with the class name, ie,
    # Television.manufacturer, it is invoked by
    # calling it on the class itself
    assert("Samsung" == Television.manufacturer)
  end

  def test_2
    # model is an instance method as it not prefixed
    # with self or Television (which is the class name)
    assert_equal(["QN75Q7F", "QN65Q7FAMFXZA"], [tele1.model, tele2.model])
  end
end