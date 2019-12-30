require 'minitest/autorun'
require 'minitest/pride'

class Exercise10Test < Minitest::Test
  def test_modify_hash
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }
    expected = {
      "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
      "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
      "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
      "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
      "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
    }
    result = Hash[
      munsters.map do |key, value|
        if value["age"] > 0 && value["age"] <= 17
          value["age_group"] = "kid"
        elsif value["age"] >= 18 && value["age"] <= 64
          value["age_group"] = "adult"
        else
          value["age_group"] = "senior"
        end
        [key, value]
      end
    ]
    assert_equal expected, result
  end
end