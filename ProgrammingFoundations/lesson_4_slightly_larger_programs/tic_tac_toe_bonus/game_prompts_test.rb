require 'minitest/autorun'
require 'minitest/pride'
require_relative './game_prompts'
include GamePrompts

class OneLinePrompts < Minitest::Test
  def test_symbol_prompt
    expected = "=> Do you want to be X's or O's?(enter only X/x or O/o)"
    assert_equal expected, ask_for_symbol_prompt
  end
end # OneLinePrompts