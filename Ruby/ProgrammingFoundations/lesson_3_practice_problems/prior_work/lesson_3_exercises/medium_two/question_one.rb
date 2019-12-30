require 'minitest/autorun'
require 'minitest/pride'

class QuestionOne < Minitest::Test
  def setup
    @munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandp" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" }
    }
  end

  def test_total_age_of_males
    males = @munsters.keys.select { |name| @munsters[name]["gender"].eql?("male") }
    assert_equal 444, males.inject(0) { |sum, name| sum += @munsters[name]["age"] }
  end

  def test_hash_inject
    sum_of_ages = 0
    @munsters.each_pair do |name, details|
      sum_of_ages += details["age"] if details["gender"].eql?("male")
    end
    assert_equal 444, sum_of_ages
  end
end