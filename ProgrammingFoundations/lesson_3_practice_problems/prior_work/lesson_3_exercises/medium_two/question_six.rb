require 'minitest/autorun'
require 'minitest/pride'

=begin
After writing this method, Spot typed the following...and before Grandpa
could stop him, he hit the Enter key with his tail:

mess_with_demographics(munsters)

Did the family's data get ransacked? Why or why not?
=end
class QuestionSix < Minitest::Test
  def setup
    @munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female" },
    }
    def mess_with_demographics(demo_hash)
      demo_hash.values.each do |family_member|
        family_member["age"] += 32
        family_member["gender"] = "other"
      end
    end
  end

# yes in the method itself he changed the hashes values
# in Ruby when you use hash[key] = anything then you are
# mutating the hash, Spot could have saved himself by
# reassigning the passed in hash to another hash inside
# the method and then working with and returning the new
# hash something like new_hash = demo_hash -> new object_id
# created
  def test_mess_with_demographics
    expected = {
      "Herman" => { "age" => 64, "gender" => "other" },
      "Lily" => { "age" => 62, "gender" => "other" },
      "Grandpa" => { "age" => 434, "gender" => "other" },
      "Eddie" => { "age" => 42, "gender" => "other" },
      "Marilyn" => { "age" => 55, "gender" => "other" },
    }
    mess_with_demographics(@munsters)
    assert_equal expected, @munsters
  end
end