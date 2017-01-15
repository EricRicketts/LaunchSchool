require 'minitest/autorun'
require 'minitest/pride'
require_relative './game_view'

class BoardTest < Minitest::Test
  # rubocop:disable Metrics/AbcSize
  def setup
    @object = Object.new
    @object.extend(GameView)
    @expected_labeled_row =
      "\u2551" + "\u0020" * 3 + "\u25ef" + "\u0020" * 3 + "\u2551" + \
      "\u0020" * 3 + "\u2573" + "\u0020" * 3 + "\u2551" + "\u0020" * 3 + \
      "\u25ef" + "\u0020" * 3 + "\u2551" + "\n"
  end
  # rubocop:enable Metrics/AbcSize

  def test_top_row_with_numbers
    actual_labeled_row = @object.show_labeled_row("\u25ef", "\u2573", "\u25ef")
    assert_equal @expected_labeled_row, actual_labeled_row
  end
end

