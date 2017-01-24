require 'minitest/autorun'
require 'minitest/pride'

class CollectionBasicsTest < Minitest::Test
  def setup
    @str = 'abcdefghi'
  end

  def test_access_single_string_chars
    assert_equal @str[2], 'c'
  end

  def test_access_multiple_string_chars
    assert_equal 'cde', @str[2, 3]
    assert_equal 'cde', @str.slice(2, 3)
  end

  def test_pickout_single_char_from_slice
    assert_equal 'c', @str.slice(2, 3)[0]
  end
end # CollectionBasicsTest