require 'minitest/autorun'
require 'minitest/pride'
require_relative './board'

class BoardTest < Minitest::Test
  def setup
    @object = Object.new
    @object.extend(Board)
  end

  def test_top_row_with_numbers
    expected_first_row =
      "\u2554" + "\u2550" * 7 + "\u2566" + "\u2550" * 7 + "\u2566" + "\u2550" * 7 + "\u2557" + "\n" + \
      "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" + "\n" + \
      "\u2551" + "\u0020" * 3 + "\u0031" + "\u0020" * 3 + "\u2551" + "\u0020" * 3 + \
      "\u0032" + "\u0020" * 3 + "\u2551" + "\u0020" * 3 + "\u0033" + "\u0020" * 3 + "\u2551" + "\n" + \
      "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" + "\n"
    actual_first_row = @object.show_top_board_row_with_numbers_in_each_square
    assert_equal expected_first_row, actual_first_row
  end
end
