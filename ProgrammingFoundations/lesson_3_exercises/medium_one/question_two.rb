require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
class QuestionTwo < Minitest::Test
  def test_add_to_hash
    expected = {
      "T" => 1, "h" => 1, "e" => 2, "F" => 1, "l" => 1, "i" => 1,
      "n" => 2, "t" => 2, "s" => 2, "o" => 2, "R" => 1, "c" => 1,
      "k" => 1
    }
    statement = "The Flintstones Rock"
    hash = {}
    statement.gsub(/\s+/, "").chars.each do |char|
      if hash.keys.include?(char)
        hash[char] += 1
      else
        hash[char] = 1
      end
    end
    assert_equal expected, hash
  end
end