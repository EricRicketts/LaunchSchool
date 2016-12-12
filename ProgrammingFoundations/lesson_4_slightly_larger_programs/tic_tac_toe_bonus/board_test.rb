require 'minitest/autorun'
require 'minitest/pride'
require_relative './board'

class BoardTest < Minitest::Test
  def setup
    @object = Object.new
    @object.extend(Board)
    @expected_top_row =
      "\u2554" + "\u2550" * 7 + "\u2566" + "\u2550" * 7 \
      + "\u2566" + "\u2550" * 7 + "\u2557" + "\n" \
      + "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 \
      + "\u2551" + "\u0020" * 7 + "\u2551" + "\n" \
      + "\u2551" + "\u0020" * 3 + "\u0031" + "\u0020" * 3 \
      + "\u2551" + "\u0020" * 3 + "\u0032" + "\u0020" * 3 \
      + "\u2551" + "\u0020" * 3 + "\u0033" + "\u0020" * 3 \
      + "\u2551" + "\n" + "\u2551" + "\u0020" * 7 + "\u2551" \
      + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" + "\n"

    @expected_middle_row =
      "\u2560" + "\u2550" * 7 + "\u256c" + "\u2550" * 7 \
      + "\u256c" + "\u2550" * 7 + "\u2563" + "\n" \
      + "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 \
      + "\u2551" + "\u0020" * 7 + "\u2551" + "\n" + "\u2551" \
      + "\u0020" * 3 + "\u0034" + "\u0020" * 3 + "\u2551" + "\u0020" * 3 \
      + "\u0035" + "\u0020" * 3 + "\u2551" + "\u0020" * 3 + "\u0036" \
      + "\u0020" * 3 + "\u2551" + "\n" + "\u2551" + "\u0020" * 7 \
      + "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" + "\n" \
      + "\u2560" + "\u2550" * 7 + "\u256c" + "\u2550" * 7 \
      + "\u256c" + "\u2550" * 7 + "\u2563" + "\n"

    @expected_bottom_row =
      "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" \
      + "\u0020" * 7 + "\u2551" + "\n" + "\u2551" + "\u0020" * 3 + "\u0037" \
      + "\u0020" * 3 + "\u2551" + "\u0020" * 3 + "\u0038" + "\u0020" * 3 \
      + "\u2551" + "\u0020" * 3 + "\u0039" + "\u0020" * 3 + "\u2551" + "\n" \
      + "\u2551" + "\u0020" * 7 + "\u2551" + "\u0020" * 7 + "\u2551" \
      + "\u0020" * 7 + "\u2551" + "\n" + "\u255a" + "\u2550" * 7 \
      + "\u2569" + "\u2550" * 7 + "\u2569" + "\u2550" * 7 + "\u255d" + "\n"

  end

  def test_top_row_with_numbers
    actual_top_row = @object.show_top_board_row(square_one: "1", \
                                                square_two: "2", \
                                                square_three: "3")
    assert_equal @expected_top_row, actual_top_row
  end

  def test_middle_row_with_numbers
    actual_middle_row = @object.show_middle_board_row(square_four: "4", \
                                                      square_five: "5", \
                                                      square_six: "6")
    assert_equal @expected_middle_row, actual_middle_row
  end

  def test_bottom_row_with_numbers
    actual_bottom_row = @object.show_bottom_board_row(square_seven: "7", \
                                                      square_eight: "8", \
                                                      square_nine: "9")
    assert_equal @expected_bottom_row, actual_bottom_row
  end
end
