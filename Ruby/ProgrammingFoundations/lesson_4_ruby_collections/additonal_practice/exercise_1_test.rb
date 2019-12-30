require 'minitest/autorun'
require 'minitest/pride'

class Exercise1Test < Minitest::Test
  def test_convert_to_hash
    hsh = {}
    flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
    expected = { "Fred" => 0, "Barney" => 1, "Wilma" => 2, "Betty" => 3, "Pebbles" => 4, "BamBam" => 5 }
    flintstones.each.with_index { |name, index| hsh[name] = index }
    assert_equal expected, hsh
  end
end