require 'minitest/autorun'
require 'minitest/pride'

class QuestionTen < Minitest::Test
  def test_array_to_hash
    flintstones = %w(Fred Wilma Barney Betty BamBam Pebbles)
    expected = {
      "Fred" => 0, "Wilma" => 1, "Barney" => 2,
      "Betty" => 3, "BamBam" => 4, "Pebbles" => 5
    }
    new_hash = flintstones.map.with_index { |name, index| Array[name, index] }.to_h
    assert_equal expected, new_hash
  end
end