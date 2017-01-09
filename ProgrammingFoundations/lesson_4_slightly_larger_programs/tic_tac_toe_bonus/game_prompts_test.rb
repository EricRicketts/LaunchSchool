require 'minitest/autorun'
require 'minitest/pride'
require_relative './game_prompts'
include GamePrompts

class OneLinePrompts < Minitest::Test
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
end # OneLinePrompts