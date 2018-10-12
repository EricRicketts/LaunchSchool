require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseThreeTest < Minitest::Test
  class House
    include Comparable
    attr_reader :price

    def initialize(price)
      @price = price
    end

    def <=>(other)
      price <=> other.price
    end
  end

  def test_one
    home1 = House.new(100_000)
    home2 = House.new(150_000)
    expected = [
      "Home 1 is cheaper",
      "Home 2 is more expensive"
    ]
    results = [
      ("Home 1 is cheaper" if home1 < home2),
      ("Home 2 is more expensive" if home2 > home1)
    ]
    assert_equal(expected, results)
  end
end