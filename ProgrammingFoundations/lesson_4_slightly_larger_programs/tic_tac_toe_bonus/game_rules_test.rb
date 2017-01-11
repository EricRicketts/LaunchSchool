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
end # TestThreeInARowWins