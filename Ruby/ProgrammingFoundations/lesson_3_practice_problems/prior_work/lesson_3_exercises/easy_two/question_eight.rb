require 'minitest/autorun'
require 'minitest/pride'

# Find the index of the first name that starts with "Be"
class QuestionEight < Minitest::Test
  def test_find_index_by_name
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    assert_equal 3, flintstones.index { |name| name.start_with?("Be") }
    assert_equal 3, flintstones.index { |name| name[0, 2] == "Be" }
    assert_equal 3, flintstones.index { |name| name =~ /\ABe/ }
  end
end