require 'minitest/autorun'
require 'minitest/pride'
require_relative './game_tally'
include GameTally

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
