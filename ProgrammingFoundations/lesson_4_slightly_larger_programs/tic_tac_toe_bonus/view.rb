require 'byebug'
module View
  SPACE = "\u0020".freeze
  LARGE_O = "\u25ef".freeze
  LARGE_X = "\u2573".freeze
  RETURN = "\n".freeze

  HORIZONTAL_LINE = "\u2550".freeze
  VERTICAL_LINE = "\u2551".freeze

  TOP_JOIN = "\u2566".freeze
  BOTTOM_JOIN = "\u2569".freeze
  BOTTOM_LEFT_CORNER = "\u255a".freeze
  BOTTOM_RIGHT_CORNER = "\u255d".freeze
  UPPER_LEFT_CORNER = "\u2554".freeze
  UPPER_RIGHT_CORNER = "\u2557".freeze
  LEFT_VERTICAL_JOIN = "\u2560".freeze
  RIGHT_VERTICAL_JOIN = "\u2563".freeze
  FOUR_WAY_JOIN = "\u256c".freeze

  def show_bottom_view_row(square_seven: SPACE, square_eight: SPACE, \
                           square_nine: SPACE)
    show_row_with_spaces + \
      show_labeled_row(square_seven, square_eight, square_nine) + \
      show_row_with_spaces + \
      show_very_bottom_row
  end

  def show_middle_view_row(square_four: SPACE, square_five: SPACE, \
                           square_six: SPACE)
    show_middle_row_join + \
      show_row_with_spaces + \
      show_labeled_row(square_four, square_five, square_six) + \
      show_row_with_spaces + \
      show_middle_row_join
  end

  def show_top_view_row(square_one: SPACE, square_two: SPACE, \
                        square_three: SPACE)
    show_very_top_row + \
      show_row_with_spaces + \
      show_labeled_row(square_one, square_two, square_three) + \
      show_row_with_spaces
  end

  def show_middle_row_join
    LEFT_VERTICAL_JOIN + HORIZONTAL_LINE * 7 + FOUR_WAY_JOIN + \
      HORIZONTAL_LINE * 7 + FOUR_WAY_JOIN + HORIZONTAL_LINE * 7 + \
      RIGHT_VERTICAL_JOIN + RETURN
  end

  # rubocop:disable Metrics/AbcSize
  def show_labeled_row(left_symbol, middle_symbol, right_symbol)
    VERTICAL_LINE + SPACE * 3 + left_symbol + SPACE * 3 + VERTICAL_LINE + \
      SPACE * 3 + middle_symbol + SPACE * 3 + VERTICAL_LINE + SPACE * 3 + \
      right_symbol + SPACE * 3 + VERTICAL_LINE + RETURN
  end
  # rubocop:enable Metrics/AbcSize

  def show_row_with_spaces
    VERTICAL_LINE + SPACE * 7 + VERTICAL_LINE + SPACE * 7 + \
      VERTICAL_LINE + SPACE * 7 + VERTICAL_LINE + RETURN
  end

  def show_very_bottom_row
    BOTTOM_LEFT_CORNER + HORIZONTAL_LINE * 7 + BOTTOM_JOIN + \
      HORIZONTAL_LINE * 7 + BOTTOM_JOIN + HORIZONTAL_LINE * 7 + \
      BOTTOM_RIGHT_CORNER + RETURN
  end

  def show_very_top_row
    UPPER_LEFT_CORNER + HORIZONTAL_LINE * 7 + TOP_JOIN + HORIZONTAL_LINE * 7 + \
      TOP_JOIN + HORIZONTAL_LINE * 7 + UPPER_RIGHT_CORNER + RETURN
  end

  def update_view(board)
    show_top_view_row(square_one: board[0],
                      square_two: board[1],
                      square_three: board[2]) + \
      show_middle_view_row(square_four: board[3],
                           square_five: board[4],
                           square_six: board[5]) + \
      show_bottom_view_row(square_seven: board[6],
                           square_eight: board[7],
                           square_nine: board[8])
  end
end
