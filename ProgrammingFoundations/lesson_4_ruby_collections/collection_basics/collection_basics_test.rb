require 'minitest/autorun'
require 'minitest/pride'

class CollectionBasicsTest < Minitest::Test
  def setup
    @str = 'abcdefghi'
    @str1 = 'The grass is green'
    @ary = %w(a b c d e f g h i)
    @hsh = { fruit: 'apple', vegetable: 'carrot' }
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

  def test_string_exercise
    assert_equal 'grass', @str1.slice(4, 5)
  end

  def test_array_slice
    assert_equal ['c', 'd', 'e'], @ary[2, 3]
    assert_equal ['c', 'd', 'e'], @ary.slice(2, 3)
  end

  def test_get_single_element_array
    assert_equal 'c', @ary[2]
    assert_equal 'c', @ary.slice(2, 3)[0]
  end

  def test_call_string_method_on_hash_value
    assert_equal 'a', @hsh[:fruit][0]
  end

  def test_duplicate_hash_keys
    hsh = { fruit: 'apple', vegetable: 'carrot', fruit: 'pear' }
    assert_equal 'pear', hsh[:fruit], 'duplicate keys, hash takes the most recent key value pair'
    expected = { fruit: 'pear', vegetable: 'carrot' }
    assert_equal expected, hsh
  end

  def test_keys_and_values_hash_methods
    assert_equal [:fruit, :vegetable], @hsh.keys
    assert_equal ['apple', 'carrot'], @hsh.values
  end
end # CollectionBasicsTest