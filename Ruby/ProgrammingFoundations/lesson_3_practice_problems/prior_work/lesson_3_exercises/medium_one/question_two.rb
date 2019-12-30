require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
class QuestionTwo < Minitest::Test
  def setup
    @statement = "The Flintstones Rock"
    @expected = {
      "T" => 1, "h" => 1, "e" => 2, "F" => 1, "l" => 1, "i" => 1,
      "n" => 2, "t" => 2, "s" => 2, "o" => 2, "R" => 1, "c" => 1,
      "k" => 1
    }
  end

  def test_add_to_hash
    hash = {}
    @statement.gsub(/\s+/, "").chars.each do |char|
      if hash.keys.include?(char)
        hash[char] += 1
      else
        hash[char] = 1
      end
    end
    assert_equal @expected, hash
  end

  def test_another_way
    hash = {}
    @statement.gsub!(/\s+/,"").chars {|char| hash[char] = @statement.count(char)}
    assert_equal @expected, hash
  end

  def test_launch_school_solution
    result = {}
    letters = ('A'..'Z').to_a + ('a'..'z').to_a
    letters.each do |letter|
      letter_frequency = @statement.scan(letter).count
      result[letter] = letter_frequency if letter_frequency > 0
    end
    assert_equal @expected, result
  end
end