require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseFourTest < Minitest::Test
  class Transform
    attr_reader :string

    def self.lowercase(str)
      str.downcase
    end

    def initialize(string)
      @string = string
    end

    def uppercase
      string.upcase
    end
  end
  def test_one
    expected = %w(ABC xyz)
    results = [
      Transform.new('abc').uppercase,
      Transform.lowercase('XYZ')
    ]
    assert_equal(expected, results)
  end
end