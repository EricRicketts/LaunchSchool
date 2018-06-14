require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  def test_hash_deletion
    ages = {
      "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10
    }
    expected = { "Herman" => 32, "Lily" => 30, "Eddie" => 10 }
    assert_equal expected, ages.reject { |_, age| age >= 100 }
    assert_equal expected, ages.keep_if { |_, age| age < 100 }
  end
end