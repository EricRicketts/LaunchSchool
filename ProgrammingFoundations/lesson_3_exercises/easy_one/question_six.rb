require 'minitest/autorun'
require 'minitest/pride'

class QuestionSix < Minitest::Test
  def test_prepend_string_one_way
    famous_words = "seven years ago..."
    prefix = "four score and "
    expected_msg = "four score and seven years ago..."
    assert_equal expected_msg, famous_words.prepend(prefix)
  end

  def test_prepend_string_another_way
    famous_words = "seven years ago..."
    prefix = "four score and "
    expected_msg = "four score and seven years ago..."
    assert_equal expected_msg, famous_words.replace(prefix + famous_words)
  end

end