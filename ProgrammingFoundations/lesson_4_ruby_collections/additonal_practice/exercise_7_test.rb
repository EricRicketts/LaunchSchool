require 'minitest/autorun'
require 'minitest/pride'

class Exercise7Test < Minitest::Test
  def test_populate_hash
    statement = "The Flintstones Rock"
    expected = { "T" => 1, "h" => 1, "e" => 2, "F" => 1, 
      "l" => 1, "i" => 1, "n" => 2, "t" => 2, "s" => 2,
      "o" => 2, "R" => 1, "c" => 1, "k" => 1 }
    result = {}
    statement.gsub(/\s/,'').chars.each do |char|
      result[char].nil? ? result[char] = 1 : result[char] += 1
    end
    assert_equal expected, result
  end
end