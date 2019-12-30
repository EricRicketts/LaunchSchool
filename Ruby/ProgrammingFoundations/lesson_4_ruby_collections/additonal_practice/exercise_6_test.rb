require 'minitest/autorun'
require 'minitest/pride'

class Exercise6Test
  def test_shorten_to_three
    flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
    expected = %w(Fre Bar Wil Bet Bam Peb)
    result = flintstones.map { |name| name.slice(0, 3) }
    assert_equal expected, result
  end
end