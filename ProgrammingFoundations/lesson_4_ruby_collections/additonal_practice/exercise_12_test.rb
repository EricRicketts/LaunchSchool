require 'minitest/autorun'
require 'minitest/pride'

class Exercise12Test < Minitest::Test
  def test_print_hash
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }
    expected = [
      "Herman is a 32 year old male",
      "Lily is a 30 year old female",
      "Grandpa is a 402 year old male",
      "Eddie is a 10 year old male",
      "Marilyn is a 23 year old female"
    ]
    result = []
    munsters.each do |name, age_and_gender|
      result.push("#{name} is a #{age_and_gender["age"]} year old #{age_and_gender["gender"]}")
    end
    assert_equal expected, result
  end
end