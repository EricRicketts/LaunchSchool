require 'minitest/autorun'
require 'minitest/pride'

class QuestionTwo < Minitest::Test
  def test_add_ages
    ages = {
      "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
      "Eddie" => 10, "Marilyn" => 22, "Spot" => 237
    }
    assert_equal 6174, ages.values.inject(:+)
  end
end