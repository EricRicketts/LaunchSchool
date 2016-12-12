require 'minitest/autorun'
require 'minitest/pride'
require_relative './tic_tac_toe'

class TicTacToeTest < Minitest::Test
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
    symbol_prompt = "=> Do you want to be X's or O's?"
    assert_equal symbol_prompt, ask_for_symbol_prompt
  end
end