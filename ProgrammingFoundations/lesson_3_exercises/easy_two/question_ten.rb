require 'minitest/autorun'
require 'minitest/pride'

# Using array#map!, shorten each of these names to just 3 characters:
# make it a one liner
class QuestionTen < Minitest::Test
  def test_shorten_names
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    expected = %w(Fre Bar Wil Bet Bam Peb)
    assert_equal expected, flintstones.map { |name| name[0..2] }
    assert_equal expected, flintstones.map { |name| name[0, 3] }
  end
end
