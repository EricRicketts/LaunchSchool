require 'minitest/autorun'
require 'minitest/pride'

require_relative '../app/tic_tac_toe_bonus'

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

