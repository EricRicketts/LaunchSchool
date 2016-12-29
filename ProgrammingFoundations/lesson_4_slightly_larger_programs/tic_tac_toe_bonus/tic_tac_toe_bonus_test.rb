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
    @player_symbols = { "player" => nil, "computer" => nil }
  end

  def test_symbol_assignment_player_is_x
    $stdin = StringIO.new("  x")
    assign_symbols(@player_symbols)
    assert_equal "X", @player_symbols["player"]
    assert_equal "O", @player_symbols["computer"]
  end

  def test_symbol_assignment_player_is_o
    $stdin = StringIO.new("  o")
    assign_symbols(@player_symbols)
    assert_equal "O", @player_symbols["player"]
    assert_equal "X", @player_symbols["computer"]
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

  def test_game_winner
    @board[0][0] = @board[0][1] = @board[2][0] = @board[2][2] = "O"
    @board[0][2] = @board[2][1] = "X"
    @board[1][0] = @board[1][1] = @board[1][2] = "X"
    player = "X"
    selected_square = 6
    assert winner_or_tie?(@board, selected_square, player)
  end

  def test_tie_game
    @board[0][0] = @board[0][2] = @board[1][0] = @board[1][1] = "0"
    @board[2][1] = "O"
    @board[0][1] = @board[1][2] = @board[2][0] = @board[2][2] = "X"
    player = "O"
    selected_square = 5
    assert winner_or_tie?(@board, selected_square, player)
  end
end # TestGameWinning

class TestAlternatingThePlayer < Minitest::Test
  def test_alternate_player_to_computer
    current_player = "player"
    assert_equal "computer", alternate_player(current_player)
  end

  def test_alternate_player_to_player
    current_player = "computer"
    assert_equal "player", alternate_player(current_player)
  end
end # TestAlternatingThePlayer

class TestMakeMoves < Minitest::Test
  def setup
    @player_symbols = { "player" => "X", "computer" => "O" }
    @board = Array.new(3) { Array.new(3, "\u0020") }
  end

  def test_select_a_square_player
    expected_square = 5
    expected_prompt = '=> available squares are: 1, 2, 3, 4, 5, 6, 7, 8, or 9'
    $stdin = StringIO.new("  5  \n")
    current_player = "player"
    actual_prompt = capture_io do
      assert_equal expected_square, select_a_square(@board, current_player)
    end
    assert_equal expected_prompt, actual_prompt.first.chomp
  end

  def test_select_a_square_computer
    current_player = "computer"
    @board[0][0] = @board[0][2] = @board[1][0] = @board[1][1] = "0"
    @board[0][1] = @board[1][2] = @board[2][0] = @board[2][2] = "X"
    expected_square = 8
    assert_equal expected_square, select_a_square(@board, current_player)
  end
end # TestMakeMoves
