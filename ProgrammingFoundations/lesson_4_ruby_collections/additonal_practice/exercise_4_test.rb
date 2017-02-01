require 'minitest/autorun'
require 'minitest/pride'

class Exercise4Test < Minitest::Test
  def test_min_value
    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
    assert_equal 10, ages.values.min
  end
end