require 'minitest/autorun'
require 'minitest/pride'

class Exercise13Test < Minitest::Test
  def create_uuid
    uuid_chars = ('a'..'z').to_a + (0..9).to_a
    uuid_chars.sample(8).join + "-" +
    uuid_chars.sample(4).join + "-" +
    uuid_chars.sample(4).join + "-" +
    uuid_chars.sample(4).join + "-" +
    uuid_chars.sample(12).join
  end

  def test_uuid
    uuid_chars = ('a'..'z').to_a + (0..9).to_a
    uuid = create_uuid
    str_lengths = [8, 4, 4, 4, 12]
    chars_and_numbers = uuid.split("-")
    chars_and_numbers.each.with_index do |str, index|
      assert str.chars.all? { |letter| uuid_chars.to_s.include?(letter) }
      assert_equal str_lengths[index], str.length
    end
    assert uuid.count("-") == 4
  end
end