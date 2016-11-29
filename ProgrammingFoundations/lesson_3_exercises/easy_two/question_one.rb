require 'minitest/autorun'
require 'minitest/pride'

class QuestionOne < Minitest::Test
  def test_key_exists_in_hash
    ages = {
      "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10
    }
    refute ages.key?("Spot")
    refute ages.keys.include?("Spot")
    refute ages.keys.member?("Spot")
  end
end
