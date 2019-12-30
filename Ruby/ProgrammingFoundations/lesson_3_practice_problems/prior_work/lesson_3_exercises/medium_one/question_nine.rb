require 'minitest/autorun'
require 'minitest/pride'

# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.
# transform the arrays as follows
class QuestionNine < Minitest::Test
  def setup
    @munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female" }
    }
    @expected = {
      "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
      "Lily" => { "age" => 30, "gender" => "female", "age_group" => "adult" },
      "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
      "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
      "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" }
    }
  end

  def add_age_group(hash)
    keys = hash.keys
    keys.each do |name|
      hash[name]["age_group"] = determine_age_group(hash[name]["age"])
    end
    hash
  end

  def determine_age_group(number)
    case number
    when 0..17 then "kid"
    when 18..64 then "adult"
    else "senior"
    end
  end

  def test_add_age_group
    assert_equal @expected, add_age_group(@munsters)
  end
end