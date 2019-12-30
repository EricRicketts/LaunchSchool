require 'minitest/autorun'
require 'minitest/pride'

# How can we add the family pet "Dino" to our usual array:
class QuestionTwo < Minitest::Test
  def test_push_onto_array
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    expected = %w(Fred Barney Wilma Betty BamBam Pebbles Dino)
    assert_equal expected, flintstones << "Dino"
  end
end