require 'minitest/autorun'
require 'minitest/pride'

class Exercise2Test < Minitest::Test
  def test_add_ages
    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
    sum_of_ages = ages.values.inject(&:+)
    assert_equal 6174, sum_of_ages
  end
end