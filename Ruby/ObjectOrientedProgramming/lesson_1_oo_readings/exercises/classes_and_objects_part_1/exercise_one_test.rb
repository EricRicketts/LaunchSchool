=begin
Create a class called MyCar. When you initialize a new instance or object of the class,
allow the user to define some instance variables that tell us the year, color, and model
of the car. Create an instance variable that is set to 0 during instantiation of the object
to track the current speed of the car as well. Create instance methods that allow the car
to speed up, brake, and shut the car off.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class MyCar
  attr_accessor :year, :color, :model, :speed

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
    @speed = 0
  end

  def brake(decrease)
    self.speed -= decrease
  end

  def shutdown
    self.speed = 0
  end

  def accelerate(increase)
    self.speed += increase
  end

end

class ExerciseOneTest < Minitest::Test

  def setup
    @car = MyCar.new("1969", "Orange", "Charger R/T-SE")
  end

  def test_1
    # skip
    expected = ["1969", "Charger R/T-SE", "Orange"]
    assert_equal(expected, [@car.year, @car.model, @car.color])
  end

  def test_2
    # skip
    3.times { @car.accelerate(10) }
    assert_equal(30, @car.speed)
  end

  def test_3
    # skip
    3.times { @car.accelerate(10) }
    3.times { @car.brake(5) }
    assert_equal(15, @car.speed)
  end

  def test_4
    # skip
    3.times { @car.accelerate(10) }
    initial_speed = @car.speed
    @car.shutdown
    assert_equal([30, 0], [initial_speed, @car.speed])
  end

end
