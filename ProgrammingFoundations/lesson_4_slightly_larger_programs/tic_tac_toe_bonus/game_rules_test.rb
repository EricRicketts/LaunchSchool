require 'minitest/autorun'
require 'minitest/pride'
require_relative './game_rules'
include GameRules

class TestThreeInARowWins < Minitest::Test
  def setup
    @board = Array.new(3) { Array.new(3, "\u0020") }
  end

  def test_win_on_a_row
    @board[1][0] = @board[1][1] = @board[1][2] = "X"
    player = "X"
    selected_square = 6
    assert_equal "X", detect_row_winner(@board, selected_square, player)
  end

  def test_no_win_on_a_row
    @board[1][0] = @board[1][2] = "O"
    @board[1][1] = "X"
    player = "O"
    selected_square = 6
    assert_nil detect_row_winner(@board, selected_square, player)
  end

 def test_win_on_a_column
    @board[0][2] = @board[1][2] = @board[2][2] = "O"
    player = "O"
    selected_square = 9
    assert_equal "O", detect_column_winner(@board, selected_square, player)
  end

  def test_no_win_on_a_column
    @board[0][2] = @board[2][2] = "X"
    @board[1][2] = "O"
    player = "X"
    selected_square = 9
    assert_nil detect_column_winner(@board, selected_square, player)
  end

  def test_generate_valid_diagonal_squares_tic_tac_toe
    expected_squares = [1, 5, 9]
    assert_equal expected_squares, generate_diagonal_square_numbers(@board)
  end

  def test_generate_valid_diagonal_squares_larger_tic_tac_toe
    large_board = Array.new(5) { Array.new(5, "\u0020") }
    expected_squares = [1, 7, 13, 19, 25]
    assert_equal expected_squares, generate_diagonal_square_numbers(large_board)
  end

  def test_win_on_a_diagonal
    @board[0][0] = @board[1][1] = @board[2][2] = "O"
    player = "O"
    selected_square = 5
    assert_equal "O", detect_diagonal_winner(@board, selected_square, player)
  end

  def test_no_square_on_a_diagonal
    @board[0][0] = @board[2][2] = "X"
    @board[1][1] = "O"
    player = "X"
    selected_square = 2
    assert_nil detect_diagonal_winner(@board, selected_square, player)
  end

  def test_no_win_on_a_diagonal
    @board[0][0] = @board[2][2] = "X"
    @board[1][1] = "O"
    player = "O"
    selected_square = 5
    assert_nil detect_diagonal_winner(@board, selected_square, player)
  end

  def test_generate_valid_anti_diagonal_squares_tic_tac_toe
    expected_squares = [3, 5, 7]
    actual_squares = generate_anti_diagonal_square_numbers(@board)
    assert_equal expected_squares, actual_squares
  end

  def test_generate_valid_anti_diagonal_squares_larger_tic_tac_toe
    large_board = Array.new(5) { Array.new(5, "\u0020") }
    expected_squares = [5, 9, 13, 17, 21]
    actual_squares = generate_anti_diagonal_square_numbers(large_board)
    assert_equal expected_squares, actual_squares
  end

  def test_win_on_an_anti_diagonal
    @board[0][2] = @board[1][1] = @board[2][0] = "O"
    player = expected = "O"
    selected_square = 7
    actual = detect_anti_diagonal_winner(@board, selected_square, player)
    assert_equal expected, actual
  end

  def test_no_square_on_an_anti_diagonal
    @board[0][2] = @board[2][0] = "X"
    @board[1][1] = "O"
    player = "X"
    selected_square = 8
    assert_nil detect_anti_diagonal_winner(@board, selected_square, player)
  end

  def test_no_win_on_an_anti_diagonal
    @board[0][2] = @board[2][0] = "X"
    @board[1][1] = "O"
    player = "O"
    selected_square = 5
    assert_nil detect_anti_diagonal_winner(@board, selected_square, player)
  end
end # TestThreeInARowWins