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

class InvalidIndicesAndKeys < Minitest::Test
  def setup
    @ary = %w(a b c d e)
    @str = 'abcde'
    @hsh = { a: 1, 'b' => 'two', c: nil }
  end

  def test_invalid_indices
    assert_nil @ary[5]
    assert_nil @str[5]
  end

  def test_array_fetch
    assert_raises(IndexError) { @ary.fetch(5) }
  end

  def test_negative_indices
    assert_equal 'd', @ary[-2]
  end

  def test_out_of_bounds_negative_indices
    str = 'ghijk'
    arr = ['g', 'h', 'i', 'j', 'k']
    assert_nil str[-6]
    assert_nil arr[-6]
    assert_raises(IndexError) { arr.fetch(-6) }
  end

  def test_invalid_hash_keys
    assert_nil @hsh[:c]
    assert_nil @hsh[:d]
    assert_raises(KeyError) { @hsh.fetch(:d) }
  end
end # InvalidIndicesAndKeys

class Conversions < Minitest::Test
  def setup
    @str = 'How do you get to Carnegie Hall?'
    @ary = %w(How do you get to Carnegie Hall?)
  end

  def test_good_join
    assert_equal @str, @ary.join(" ")
    assert_equal @str, @ary.inject('') { |memo, word| memo << "#{word} " }.chop
  end

  def test_array_to_hash
    hsh = { name: 'Joe', age: 10, favorite_color: 'blue' }
    ary = arr = [[:name, 'Joe'], [:age, 10], [:favorite_color, 'blue']]
    assert_equal hsh, arr.to_h
  end
end # Conversions

class Assignments < Minitest::Test
  def setup
    @str = "joe's favorite color is blue."
    @ary = [1, 2, 3, 4, 5]
    @hsh = { apple: 'Produce', carrot: 'Produce', pear: 'Produce', broccoli: 'Produce' }
  end

  def test_capitalize_each_word
    expected = "Joe's Favorite Color Is Blue."
    assert_equal expected, @str.split.map { |word| word.capitalize }.join(" ")
  end

  def test_increment_each_array_element
    expected = [2, 3, 4, 5, 6]
    assert_equal expected, @ary.map { |number| number += 1 }
  end

  def test_modify_hash
    expected = { apple: 'Fruit', carrot: 'Vegetable', pear: 'Fruit', broccoli: 'Vegetable' }
    fruit = @hsh.keys.select { |produce| produce == :apple || produce == :pear }
    vegetables = @hsh.keys.select { |produce| produce == :carrot || produce == :broccoli }
    fruit.each { |produce| @hsh[produce] = 'Fruit' }
    vegetables.each { |produce| @hsh[produce] = 'Vegetable' }
    assert_equal expected, @hsh
  end
end # Assignments