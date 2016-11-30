require 'minitest/autorun'
require 'minitest/pride'

# Using array#map!, shorten each of these names to just 3 characters:
class QuestionNine < Minitest::Test
  def test_shorten_names
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    expected = %w(Fre Bar Wil Bet Bam Peb)
    shortened_names = flintstones.map do |name|
      name.slice(0..2)
    end
    assert_equal expected, shortened_names
  end
end
