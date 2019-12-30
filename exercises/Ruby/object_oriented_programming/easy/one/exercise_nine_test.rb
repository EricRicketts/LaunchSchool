require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseNineTest < Minitest::Test
  class Pet
    def initialize(name, age)
      @name = name
      @age = age
    end
  end

  class Cat < Pet
    def initialize(name, age, color)
      super(name, age)
      @color = color
    end

    def to_s
      "My cat #{@name} is #{@age} years old and has #{@color} fur."
    end
  end

  def test_one
    pudding = Cat.new("Pudding", 7, 'black and white')
    expected = "My cat Pudding is 7 years old and has black and white fur."
    assert_equal(expected, pudding.to_s)
  end

  def test_two
    butterscotch = Cat.new("Butterscotch", 10, 'tan and white')
    expected = "My cat Butterscotch is 10 years old and has tan and white fur."
    assert_equal(expected, butterscotch.to_s)
  end

end