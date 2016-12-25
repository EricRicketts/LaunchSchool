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
    valid_squares = collect_unoccupied_squares(@board)
    square = "4.5"
    refute valid_square_selection?(square, valid_squares)
  end

  def test_player_selects_an_occupied_square
    @board[0][0] = "X"
    valid_squares = collect_unoccupied_squares(@board)
    square = "1"
    refute valid_square_selection?(square, valid_squares)
  end

  def test_valid_player_square_selection
    @board[0][0] = @board[0][2] = "X"
    @board[1][1] = "O"
    valid_squares = collect_unoccupied_squares(@board)
    square = "4"
    assert valid_square_selection?(square, valid_squares)
  end
end # TestValidMoves

class TestSymbolAssignmentAndDisplayConversion < MiniTest::Test
  def setup
    @board = Array.new(3) { Array.new(3, "\u0020") }
  end

  def test_symbol_assignment_player_is_x
    $stdin = StringIO.new("  x")
    player, computer = assign_symbols
    assert_equal "X", player
    assert_equal "O", computer
  end

  def test_symbol_assignment_player_is_o
    $stdin = StringIO.new("  o")
    player, computer = assign_symbols
    assert_equal "O", player
    assert_equal "X", computer
  end

  def test_mark_board_at_square
    board = [["O", " ", " "], [" ", "X", " "], [" ", " ", "O"]]
    mark_board_at_square(@board, 1, "O")
    mark_board_at_square(@board, 5, "X")
    mark_board_at_square(@board, 9, "O")
    assert_equal board, @board
  end

  def test_convert_symbols
    expected_symbols = ["\u2573", "\u25ef", "\u0020"]
    symbol_for_x = convert_symbol("X")
    symbol_for_o = convert_symbol("O")
    default_symbol = convert_symbol("")
    assert_equal expected_symbols, [symbol_for_x, symbol_for_o, default_symbol]
  end

  def test_convert_a_board
    @board[0][0] = @board[0][2] = "X"
    @board[1][1] = "O"
    @board[2][0] = @board[2][2] = "O"
    expected_board = [
      "\u2573", "\u0020", "\u2573",
      "\u0020", "\u25ef", "\u0020",
      "\u25ef", "\u0020", "\u25ef"
    ]
    assert_equal expected_board, convert_board(@board)
  end
end # TestSymbolAssignmentAndDisplayConversion

class TestGameWinning < Minitest::Test
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

end # TestGameWinning
