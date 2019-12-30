require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ProtectingHashTest < Minitest::Test

  def setup
    @munsters = {
      "Herman" => { "age" => 32, "gender" => "male" },
      "Lily" => { "age" => 30, "gender" => "female" },
      "Grandpa" => { "age" => 402, "gender" => "male" },
      "Eddie" => { "age" => 10, "gender" => "male" },
      "Marilyn" => { "age" => 23, "gender" => "female"}
    }    
  end

  def protect_hash(hsh)
    new_hsh = {}
    hsh.each do |k, v|
      new_k = String.new(k)
      new_hsh[new_k] = Hash[String.new(v.keys.first), v.values.first + 100, String.new(v.keys.last), "other"]
    end
    new_hsh
  end

  def test_0
    new_hsh = protect_hash(@munsters)
    refute_equal(@munsters, new_hsh)
    refute_equal(new_hsh.keys.first.object_id, @munsters.keys.first.object_id)
  end  
end