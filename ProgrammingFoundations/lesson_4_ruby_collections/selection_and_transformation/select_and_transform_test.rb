require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

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

class SelectAndTransformTestManualSolutions < Minitest::Test

  def select_fruit(food_hsh)
    num_produce = food_hsh.size
    counter = 0
    select_food_hsh = {}
    all_produce = food_hsh.keys

    loop do
      break if counter >= num_produce # had to move this to the top if food_hsh is empty

      current_produce = all_produce[counter]
      if food_hsh[current_produce] == 'Fruit'
        select_food_hsh[current_produce] = food_hsh[current_produce]
      end 
      counter += 1
    end

    select_food_hsh    
  end

  def double_numbers!(num_arr)
    number_elements = num_arr.size
    counter = 0

    loop do
      break if counter >= number_elements
      current_value = num_arr[counter]
      num_arr[counter] = 2*current_value
      counter += 1
    end

    num_arr
  end

  def double_odd_indices(arr)
    double_arr = []
    last_idx = arr.size - 1

    0.upto(last_idx) do |idx|
      value = idx.odd? ? arr[idx]*2 : arr[idx]
      double_arr.push(value)
    end

    double_arr
  end

  def multiply(arr, factor=1)
    result = []
    count = 0

    loop do
      break if count >= arr.size
      result.push(arr[count]*factor)
      count += 1
    end

    result
  end

  def test_select_hash
    produce = {
      'apple' => 'Fruit', 'carrot' => 'Vegetable',
      'pear' => 'Fruit', 'broccoli' => 'Vegetable'
    }

    expected = {'apple' => 'Fruit', 'pear' => 'Fruit'}
    result = select_fruit(produce)
    assert_equal(expected, result)   
  end

  def test_mutating_double_number_method
    arr = (1..5).to_a
    double_numbers!(arr)
    assert_equal([2, 4, 6, 8, 10], arr)    
  end

  def test_double_numbers_by_odd_indices
    arr = (0..9).to_a
    expected = arr.map.with_index {|n, idx| idx.odd? ? n*2 : n}
    assert_equal(expected, double_odd_indices(arr))
  end

  def test_multiply_numbers
    arr = (1..6).to_a
    expected = (3..18).step(3).to_a
    result = multiply(arr, 3)
    assert_equal(expected, result)
  end
  
end