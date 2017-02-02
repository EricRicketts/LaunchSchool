require 'minitest/autorun'
require 'minitest/pride'
require_relative './game_text'
include GameText

class OneLineTexts < Minitest::Test
  def test_symbol_prompt
    expected = "=> Do you want to be X's or O's?(enter only X/x or O/o)"
    assert_equal expected, ask_for_symbol
  end

  def test_ask_for_another_game
    expected = "=> Do you want to play again? (enter only Y/y or N/n): "
    assert_equal expected, ask_for_another_game
  end

  def test_invalid_continue_game_query
    expected = "=> Hmm ... that does not look like a correct response, " \
    "enter only Y/y or N/n: "
    assert_equal expected, invalid_continue_game_response
  end

  def test_joinor
    assert_equal '', joinor([])
    assert_equal "1", joinor([1])
    assert_equal "1 or 2", joinor([1, 2])
    assert_equal "1, 2, or 3", joinor([1, 2, 3])
    assert_equal "1; 2; or 3", joinor([1, 2, 3], '; ')
    assert_equal "1, 2, and 3", joinor([1, 2, 3], ', ', 'and')
  end
end # OneLineTexts

class MultiLineTexts < Minitest::Test
  def test_initial_greeting
    expected_part1 = "Welcome to Tic Tac Toe!!\n"
    expected_part2 = "You will be playing the computer.\n\n"
    expected = expected_part1 + expected_part2

    assert_equal expected, initial_greeting
  end

  def test_game_instructions
    line1 = "You will choose whether to be X's or O's.\n"
    line2 = "You will move first, followed by the computer.\n"
    line3 = "The board will be updated and shown after each move.\n"
    line4 = "\n"
    line5 = "A board with numbered squares is shown below.\n"
    line6 = "To move enter a number representing an unoccupied square.\n\n"
    expected = line1 + line2 + line3 + line4 + line5 + line6

    assert_equal expected, game_instructions
  end
end # MultiLineTexts