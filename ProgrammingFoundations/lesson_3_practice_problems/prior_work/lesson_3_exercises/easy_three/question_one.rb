require 'minitest/autorun'
require 'minitest/pride'

# Show an easier way to write this array
class QuestionOne < Minitest::Test
  def test_short_array_declaration
    flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
    shortened_declaration = %w(Fred Barney Wilma Betty BamBam Pebbles)
    assert_equal flintstones, shortened_declaration
  end
end