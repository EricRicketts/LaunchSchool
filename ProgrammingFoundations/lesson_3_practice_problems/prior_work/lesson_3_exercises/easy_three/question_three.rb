require 'minitest/autorun'
require 'minitest/pride'

class QuestionThree < Minitest::Test
  def test_push_items_onto_array
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    expected = %w(Fred Barney Wilma Betty BamBam Pebbles Dino Hoppy)
    assert_equal expected, flintstones.push("Dino", "Hoppy")
  end
end