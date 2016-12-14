module Board
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

  def show_bottom_board_row(square_seven: SPACE, square_eight: SPACE, \
                            square_nine: SPACE)
    show_row_with_spaces + \
      show_labeled_row(square_seven, square_eight, square_nine) + \
      show_row_with_spaces + \
      show_very_bottom_row
  end

  def show_middle_board_row(square_four: SPACE, square_five: SPACE, \
                            square_six: SPACE)
    show_middle_row_join + \
      show_row_with_spaces + \
      show_labeled_row(square_four, square_five, square_six) + \
      show_row_with_spaces + \
      show_middle_row_join
  end

  def show_top_board_row(square_one: SPACE, square_two: SPACE, \
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

  def show_labeled_row(left_symbol, middle_symbol, right_symbol)
    VERTICAL_LINE + SPACE * 3 + left_symbol + SPACE * 3 + VERTICAL_LINE + \
      SPACE * 3 + middle_symbol + SPACE * 3 + VERTICAL_LINE + SPACE * 3 + \
      right_symbol + SPACE * 3 + VERTICAL_LINE + RETURN
  end

  def show_numbered_board
    show_top_board_row(square_one: "1", square_two: "2",
                       square_three: "3") + \
      show_middle_board_row(square_four: "4", square_five: "5",
                            square_six: "6") + \
      show_bottom_board_row(square_seven: "7", square_eight: "8",
                            square_nine: "9")
  end

  def show_row_with_spaces
    VERTICAL_LINE + SPACE * 7 + VERTICAL_LINE + SPACE * 7 + \
      VERTICAL_LINE + SPACE * 7 + VERTICAL_LINE + RETURN
  end

  def show_starting_board
    show_top_board_row + \
      show_middle_board_row + \
      show_bottom_board_row
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

  def update_board(top_row, middle_row, bottom_row)
    show_top_board_row(square_one: top_row[0],
                       square_two: top_row[1],
                       square_three: top_row[2]) + \
      show_middle_board_row(square_four: middle_row[0],
                            square_five: middle_row[1],
                            square_six: middle_row[2]) + \
      show_bottom_board_row(square_seven: bottom_row[0],
                            square_eight: bottom_row[1],
                            square_nine: bottom_row[2])

  end
end
