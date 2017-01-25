require 'minitest/autorun'
require 'minitest/pride'

class  SelectAndTransformTest < Minitest::Test
  def test_select_hash
    produce = {
      'apple' => 'Fruit',
      'carrot' => 'Vegetable',
      'pear' => 'Fruit',
      'broccoli' => 'Vegetable'
    }
    expected = { 'apple' => 'Fruit', 'pear' => 'Fruit' }
    assert_equal expected, produce.select { |k, v| v == 'Fruit' }
  end

  def test_double_numbers
    ary = [1, 2, 3, 4, 5]
    ary.map! { |number| number * 2 }
    assert_equal [2, 4, 6, 8, 10], ary
  end

  def test_double_only_odds
    ary = [1, 2, 4, 6, 3, 9, 11, 5, 7]
    expected = [2, 2, 4, 6, 6, 18, 22, 10, 14]
    assert_equal expected, ary.map { |number| number.odd? ? number * 2 : number }
  end

  def test_double_only_odd_indices
    ary = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    expected = [0, 2, 2, 6, 4, 10, 6, 14, 8, 18]
    assert_equal expected, ary.map.with_index { |number, index| index.odd? ? number * 2 : number }
  end

  def test_multiply_by_any_value
    def multiply(ary, multiplier)
      ary.map { |number| number * multiplier }
    end
    ary = [1, 2, 3]
    expected = [3, 6, 9]
    assert_equal expected, multiply(ary, 3)
  end

  def test_how_many_times_letter_in_string
    str = "How many times does a particular character appear in this sentence?"
    def select_letter(str, letter)
      ary_of_letters = str.chars.select { |char| char == letter }
      { "#{letter}" => ary_of_letters.length }
    end
    expected = { "a" => 8 }
    assert_equal expected, select_letter(str, "a")
  end
end