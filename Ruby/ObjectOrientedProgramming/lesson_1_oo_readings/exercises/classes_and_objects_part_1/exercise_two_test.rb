=begin
Add an accessor method to your MyCar class to change and view the color of your car.
Then add an accessor method that allows you to view, but not modify, the year of your car.
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class MyCar
  attr_accessor :color
  attr_reader :year

  def initialize(y, c, m)
    @year = y
    @color = c
    @model = m
  end

end

class ExerciseTwoTest < Minitest::Test

  def setup
    @car = MyCar.new("1969", "Orange", "Charger R/T-SE")
  end

  def test_1
    # skip
    assert_equal("1969", @car.year)
  end

  def test_2
    # skip
    initial_color = @car.color
    @car.color = "Blue"
    assert_equal(["Orange", "Blue"], [initial_color, @car.color])
  end

end
