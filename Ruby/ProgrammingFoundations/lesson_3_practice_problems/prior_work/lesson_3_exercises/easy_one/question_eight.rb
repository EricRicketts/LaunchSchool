require 'minitest/autorun'
require 'minitest/pride'

class QuestionEight < Minitest::Test
  def test_array_flatten
    flintstones = ['Fred', 'Wilma']
    flintstones << ['Barney', 'Betty']
    flintstones << ['BamBam', 'Pebbles']
    expected_array = %w(Fred Wilma Barney Betty BamBam Pebbles)
    flintstones.flatten!
    assert_equal expected_array, flintstones
  end
end