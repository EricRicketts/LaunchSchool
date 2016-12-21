require 'minitest/autorun'
require 'minitest/pride'
require_relative './tic_tac_toe_bonus'

class TestDisplayStatements < Minitest::Test
  def test_joinor
    assert_equal '', joinor([])
    assert_equal "1", joinor([1])
    assert_equal "1 or 2", joinor([1, 2])
    assert_equal "1, 2, or 3", joinor([1, 2, 3])
    assert_equal "1; 2; or 3", joinor([1, 2, 3], '; ')
    assert_equal "1, 2, and 3", joinor([1, 2, 3], ', ', 'and')
  end
end # TestDisplayStatements

class TestValidMoves < Minitest::Test
  def test_completely_empty_board_has_all_squares_unoccupied
    board = Array.new(3) { Array.new(3, "\u0020") }
    open_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal open_squares, collect_unoccupied_squares(board)
  end

  def test_partially_filled_board_has_occupied_squares
    board = Array.new(3) { Array.new(3, "\u0020") }
    board[0][0] = board[2][2] = "O"
    board[1][1] = "X"
    open_squares = [2, 3, 4, 6, 7, 8]
    assert_equal open_squares, collect_unoccupied_squares(board)
  end
end # TestValidMoves
