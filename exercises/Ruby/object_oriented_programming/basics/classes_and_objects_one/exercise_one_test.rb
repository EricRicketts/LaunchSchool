require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseOneTest < Minitest::Test
  def test_one
    expected = [String, Integer, Array]
    results = ["Hello".class, 5.class, [1, 2, 3].class]
    assert_equal(expected, results)
  end
end