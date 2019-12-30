require 'minitest/autorun'
require 'minitest/pride'

class QuestionFive < Minitest::Test
  def setup

    def is_an_ip_number?(word)
      (0..255).include?(word.to_i)
    end

    def dot_separated_ip_address?(input_string)
      dot_separated_words = input_string.split(".")
      dot_separated_words.size == 4 &&
        dot_separated_words.all? { |word| is_an_ip_number?(word) }
    end

  end # setup

  def test_valid_ip_number
    assert is_an_ip_number?('55')
  end

  def test_invalid_ip_number
    refute is_an_ip_number?('270')
  end

  def test_too_few_numbers
    refute dot_separated_ip_address?('123.44.56')
  end

  def test_too_many_numbers
    refute dot_separated_ip_address?('123.44.56.100.78')
  end

  def test_valid_ip_address
    assert dot_separated_ip_address?('135.5.76.123')
  end

  def test_invalid_ip_address
    refute dot_separated_ip_address?('230.500.39.190')
  end
end
