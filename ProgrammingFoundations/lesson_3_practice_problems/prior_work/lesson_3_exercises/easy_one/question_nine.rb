require 'minitest/autorun'
require 'minitest/pride'

class QuestionNine < Minitest::Test
  def test_map_hash_to_array
    flintstones = {
      "Fred" => 0, "Wilma" => 1, "Barney" => 2,
      "Betty" => 3, "BamBam" => 4, "Pebbles" => 5
    }
    assert_equal ["Barney", 2], flintstones.assoc("Barney")
  end
end