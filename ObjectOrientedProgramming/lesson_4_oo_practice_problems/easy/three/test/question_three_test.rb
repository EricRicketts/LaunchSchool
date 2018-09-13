require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

When objects are created they are a separate realization of a particular class.

Given the class below, how do we create two different instances of this class,
both with separate names and ages?

class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end
=end

class QuestionThreeTest < Minitest::Test

  class AngryCat
    def initialize(age, name)
      @age = age
      @name = name
    end

    def age
      @age
    end

    def name
      @name
    end

    def hiss
      "Hisssss!!!"
    end
  end

  attr_accessor :cassie, :sammy

  def setup
    @cassie = AngryCat.new(3, "Cassie")
    @sammy = AngryCat.new(4, "Sammy")
  end

  def test_1
    refute(cassie.age == sammy.age)
  end

  def test_2
    refute(cassie.name == sammy.name)
  end
end
