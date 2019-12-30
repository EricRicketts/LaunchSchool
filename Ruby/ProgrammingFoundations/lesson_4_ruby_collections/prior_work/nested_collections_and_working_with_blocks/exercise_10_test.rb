require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'
class Exercise10Test < Minitest::Test

  def test_pick_colors_and_sizes
    hsh = {
      'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
      'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
      'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
      'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
      'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'}
    }
    expected = %w(Red Green SMALL Orange MEDIUM Red Green MEDIUM Orange MEDIUM Green LARGE)
    array_of_hashes = hsh.values
    result = []
    array_of_hashes.each do |block_hsh|
      colors = block_hsh[:colors].map { |color| color.capitalize }
      size = block_hsh[:size].upcase
      result.push(*colors, size)
    end
    assert_equal expected.sort, result.sort
  end

  def test_pick_colors_and_sizes_correct_solution
    # the problem description confused me authors wanted the array of
    # colors and sizes as they are not flattened into one single array
    hsh = {
      'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
      'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
      'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
      'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
      'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'}
    }
    expected = [%w(Red Green), 'SMALL', %w(Orange), 'MEDIUM', %w(Red Green), 'MEDIUM', %w(Orange), 'MEDIUM', %w(Green), 'LARGE']
    result = []
    hsh.values.each do |hsh_value|
      result.push(hsh_value[:colors].map { |color| color.capitalize })
      result.push(hsh_value[:size].upcase)
    end
    assert_equal expected, result
  end
end