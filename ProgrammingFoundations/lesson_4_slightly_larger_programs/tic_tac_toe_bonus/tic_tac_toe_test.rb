require 'minitest/autorun'
require 'minitest/pride'
require_relative './tic_tac_toe'

class InitialSetupAndInstructions < Minitest::Test
  def setup
    @instructions = "=> You will choose whether to be X's or O's." + "\n" \
      + "You will move first, followed by the computer.  The board" + "\n" \
      + "will be updated and shown after each move.  Three of a" + "\n" \
      + "kind in a row: horizontal, vertical, or diagonal wins the" + "\n" \
      + "game.  If all the squares are occupied with no three of a" + "\n" \
      + "kind in a row, then the game is a tie.  A board with" + "\n" \
      + "numbered squares is shown below.  To move enter a number" + "\n" \
      + "representing an unoccupied square." + "\n"
  end

  def test_greeting
    greeting = "=> Welcome to Tic Tac Toe!!" + "\n" \
      "You will be playing the computer.\n"
    assert_equal greeting, show_initial_greeting
  end

  def test_instructions
    assert_equal @instructions, show_instructions
  end

  def test_user_symbol_prompt
    symbol_prompt = "=> Do you want to be X's or O's?(enter only X/x or O/o)"
    assert_equal symbol_prompt, ask_for_symbol_prompt
  end
end # class InitialSetupAndInstructions

class GameLogic < Minitest::Test
  def setup
    @board = Array.new(3){ Array.new(3, "") }
  end

  def test_write_to_a_square
    mark_board_at_square(@board, 1, "X")
    mark_board_at_square(@board, 9, "O")
    expected_board = [["X", "", ""], ["", "", ""], ["", "", "O"]]
    assert_equal expected_board, @board
  end

  def test_score_current_row
    board = [["", "", ""], ["X", "X", "O"],[ "O", "O", "O"]]
    assert_equal 0, score_current_row(board, 2)
    assert_equal -1, score_current_row(board, 4)
    assert_equal 3, score_current_row(board, 9)
  end

  def test_score_current_column
    board = [
      ["X", "O", ""],
      ["O", "X", "X"],
      ["O", "", "X"]
    ]
    assert_equal 1, score_current_column(board, 4)
    assert_equal 0, score_current_column(board, 2)
    assert_equal -2, score_current_column(board, 9)
  end

  def test_score_diagonals
    board = [
      ["X", "O", "X"],
      ["",  "O", "O"],
      ["O", "X", "X"]
    ]
    assert_equal -1, score_diagonal(board, 1)
    assert_equal 1, score_anti_diagonal(board, 7)
  end

  def test_occupied_squares
    board = [
      ["X", "O", "X"],
      ["",  "O", "O"],
      ["",  "X", "X"]
    ]
    assert occupied_square?(board, 3)
    refute occupied_square?(board, 7)
  end

  def test_get_unoccupied_squares
    board = [
      ["X",  "", "X"],
      ["",  "O", "O"],
      ["",  "X", ""]
    ]
    assert_equal [1, 3, 6, 8], collect_unoccupied_squares(board)
  end

  def test_convert_symbols
    assert_equal "\u2573", convert_symbol("X")
    assert_equal "\u25ef", convert_symbol("O")
    assert_equal "\u0020", convert_symbol("")
  end
end # class GameLogic