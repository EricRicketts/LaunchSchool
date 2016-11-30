require 'minitest/autorun'
require 'minitest/pride'

class QuestionFive < Minitest::Test
  def test_add_hashes
    ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
    additional_ages = { "Marilyn" => 22, "Spot" => 237 }
    expected = {
      "Herman" => 32, "Lily" => 30, "Grandpa" => 5843,
      "Eddie" => 10, "Marilyn" => 22, "Spot" => 237
    }
    assert_equal expected, ages.merge(additional_ages)
  end
end