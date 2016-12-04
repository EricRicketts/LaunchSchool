require 'minitest/autorun'
require 'minitest/pride'

# print out the name, age and gender of each family member:
# like this (Name) is a (age) year old (male or female).
class QuestionTwo < Minitest::Test
  def setup
  @munsters = {
    "Herman" => { "age" => 32, "gender" => "male" },
    "Lily" => { "age" => 30, "gender" => "female" },
    "Grandpa" => { "age" => 402, "gender" => "male" },
    "Eddie" => { "age" => 10, "gender" => "male" },
    "Marilyn" => { "age" => 23, "gender" => "female"}
  }
  end

  def display_character_information_for(name, hash)
    "#{name} is a #{hash[name]["age"]} year old #{hash[name]["gender"]}"
  end

  def test_present_character_data
    expected = "Lily is a 30 year old female"
    character_data = display_character_information_for("Lily", @munsters)

    assert_equal expected, character_data
  end
end