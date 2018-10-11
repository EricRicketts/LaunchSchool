require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseEightTest < Minitest::Test
  class Rectangle
    def initialize(height, width)
      @height = height
      @width = width
    end

    def area
      @height * @width
    end
  end

  class Square < Rectangle
    def initialize(side)
      super(side, side)
    end
  end

  def test_one
    expected = "area of square = 25"
    result = "area of square = #{Square.new(5).area}"
    assert_equal(expected, result)
  end
end