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

class TestDisplayWinnerOrTie < Minitest::Test
  def setup
    @board = Array.new(3) { Array.new(3, "\u0020") }
    @player_symbols = { "player" => "X", "computer" => "O" }
    @current_player = "player"
    @selected_square = 0
    @tally = { "player" => 0, "computer" => 0 }
  end

  def test_player_win_on_row
    @selected_square = 6
    expected_tally = { "player" => 1, "computer" => 0 }
    @board[1][0] = @board[1][1] = @board[1][2] = "X"
    @board[0][0] = @board[0][1] = "O"
    actual_output = declare_winner_and_update_tally(@board, @selected_square,
                                                    @player_symbols,
                                                    @current_player, @tally)
    assert_equal "You win!!", actual_output
    assert_equal expected_tally, @tally
  end

  def test_computer_win_on_column
    @selected_square = 9
    expected_tally = { "player" => 0, "computer" => 1 }
    @board[0][0] = @board[1][0] = @board[1][1] = "X"
    @board[0][2] = @board[1][2] = @board[2][2] = "O"
    @current_player = "computer"
    actual_output = declare_winner_and_update_tally(@board, @selected_square,
                                                    @player_symbols,
                                                    @current_player, @tally)
    assert_equal "Computer wins!!", actual_output
    assert_equal expected_tally, @tally
  end

  def test_player_wins_on_diagonal
    @tally = { "player" => 1, "computer" => 2 }
    @player_symbols = { "player" => "O", "computer" => "X" }
    @selected_square = 1
    @current_player = "player"
    expected_tally = { "player" => 2, "computer" => 2 }
    @board[0][0] = @board[1][1] = @board[2][2] = "O"
    @board[1][0] = @board[1][2] = "X"
    actual_output = declare_winner_and_update_tally(@board, @selected_square,
                                                    @player_symbols,
                                                    @current_player, @tally)
    assert_equal "You win!!", actual_output
    assert_equal expected_tally, @tally
  end

  def test_computer_wins_on_anti_diagonal
    @tally = { "player" => 1, "computer" => 2 }
    @player_symbols = { "player" => "O", "computer" => "X" }
    @selected_square = 7
    @current_player = "computer"
    expected_tally = { "player" => 1, "computer" => 3 }
    @board[0][2] = @board[1][1] = @board[2][0] = "X"
    @board[1][0] = @board[1][2] = @board[0][0] = "O"
    actual_output = declare_winner_and_update_tally(@board, @selected_square,
                                                    @player_symbols,
                                                    @current_player, @tally)
    assert_equal "Computer wins!!", actual_output
    assert_equal expected_tally, @tally
  end

  def test_tie_game
    @player_symbols = { "player" => "O", "computer" => "X" }
    @tally = { "player" => 2, "computer" => 1 }
    expected_tally = { "player" => 2, "computer" => 1 }
    @selected_square = 8
    @current_player = "player"
    @board[0][0] = @board[0][2] = @board[1][0] = @board[1][1] = "0"
    @board[2][1] = "O"
    @board[0][1] = @board[1][2] = @board[2][0] = @board[2][2] = "X"
    actual_output = declare_winner_and_update_tally(@board, @selected_square,
                                                    @player_symbols,
                                                    @current_player, @tally)
    assert_equal "It is a tie!!", actual_output
    assert_equal expected_tally, @tally
  end
end # TestDisplayWinnerOrTie

class TestFirstToFiveAndFinalTally < Minitest::Test
  def setup
    @tally = { "player" => 3, "computer" => 3 }
  end

  def test_player_first_to_five
    @tally["player"] = 5
    assert there_is_a_winner?(@tally)
  end

  def test_computer_first_to_five
    @tally["computer"] = 5
    assert there_is_a_winner?(@tally)
  end

  def test_neither_to_five
    refute there_is_a_winner?(@tally)
  end

  def test_final_tally_player_wins
    @tally["player"] = 5
    expected = "You won the game!!\nGood-bye!!"
    assert_equal expected, show_final_tally_message(@tally)
  end

  def test_final_tally_computer_wins
    @tally["computer"] = 5
    expected = "The computer won the game!!\nGood-bye!!"
    assert_equal expected, show_final_tally_message(@tally)
  end

  def test_final_tally_tie_or_incomplete_game
    expected = "No winner.\nGood-bye!!"
    assert_equal expected, show_final_tally_message(@tally)
  end
end # TestFirstToFiveAndFinalTally

class TestContinueGameQuery < Minitest::Test

  def test_ask_to_play_again
    $stdin = StringIO.new("y\n")
    prompts = capture_io do
      refute do_not_play_again?
    end
    expected = "=> Do you want to play again? (enter only Y/y or N/n): "
    assert_equal expected, prompts.first.chomp
  end

  def test_quit_the_game
    $stdin = StringIO.new("N\n")
    prompts = capture_io do
      assert do_not_play_again?
    end
    expected = "=> Do you want to play again? (enter only Y/y or N/n): "
    assert_equal expected, prompts.first.chomp
  end
end # TestContinueGameQuery

