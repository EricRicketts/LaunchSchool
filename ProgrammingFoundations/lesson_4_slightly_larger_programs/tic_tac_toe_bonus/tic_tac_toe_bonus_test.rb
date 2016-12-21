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
  def setup
    @board = Array.new(3) { Array.new(3, "\u0020") }
  end

  def test_completely_empty_board_has_all_squares_unoccupied
    open_squares = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert_equal open_squares, collect_unoccupied_squares(@board)
  end

  def test_partially_filled_board_has_occupied_squares
    @board[0][0] = @board[2][2] = "O"
    @board[1][1] = "X"
    open_squares = [2, 3, 4, 6, 7, 8]
    assert_equal open_squares, collect_unoccupied_squares(@board)
  end

  def test_player_makes_an_invalid_command_line_entry
    $stdin = StringIO.new(" 4.5 ")
    refute valid_square_selection?(@board)
  end

  def test_player_selects_an_occupied_square
    @board[0][0] = "X"
    $stdin = StringIO.new("1")
    refute valid_square_selection?(@board)
  end

  def test_valid_player_square_selection
    @board[0][0] = @board[0][2] = "X"
    @board[1][1] = "O"
    $stdin = StringIO.new("  4  ")
    assert valid_square_selection?(@board)
  end
end # TestValidMoves
