require 'minitest/autorun'
require 'minitest/pride'

class Exercise11Test < Minitest::Test
  def test_sum_male_ages
    munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" }
    }
    sum_of_male_ages = munsters.values.select { |hsh| hsh["gender"].eql?("male") }.inject(0) { |sum, hsh| sum += hsh["age"] }
    assert_equal 444, sum_of_male_ages
  end
end