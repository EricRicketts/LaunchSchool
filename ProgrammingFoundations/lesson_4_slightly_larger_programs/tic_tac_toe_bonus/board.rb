module Board
  SPACE = "\u0020".freeze
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

  ONE =   "\u0031".freeze
  TWO =   "\u0032".freeze
  THREE = "\u0033".freeze
  FOUR =  "\u0034".freeze
  FIVE =  "\u0035".freeze
  SIX =   "\u0036".freeze
  SEVEN = "\u0037".freeze
  EIGHT = "\u0038".freeze
  NINE =  "\u0039".freeze

  def show_entire_bottom_board_row
    show_row_with_spaces + \
      show_bottom_row_with_numbers + \
      show_row_with_spaces + \
      show_very_bottom_row
  end

  def show_bottom_row_with_numbers
    VERTICAL_LINE + spaces(3) + SEVEN + spaces(3) + VERTICAL_LINE + spaces(3) + EIGHT + \
      spaces(3) + VERTICAL_LINE + spaces(3) + NINE + spaces(3) + VERTICAL_LINE + RETURN
  end

  def show_entire_middle_board_row
    show_middle_row_join + \
      show_row_with_spaces + \
      show_middle_row_with_numbers + \
      show_row_with_spaces + \
      show_middle_row_join
  end

  def show_entire_top_board_row(square_one: SPACE, square_two: SPACE, \
                                square_three: SPACE)
    show_very_top_row + \
      show_row_with_spaces + \
      show_labeled_row(square_one, square_two, square_three) + \
      # show_top_row_with_numbers + \
      show_row_with_spaces
  end

  def horizontal_lines(number)
    HORIZONTAL_LINE * number
  end

  def spaces(number)
    SPACE * number
  end


  def show_middle_row_join
    LEFT_VERTICAL_JOIN + horizontal_lines(7) + FOUR_WAY_JOIN + \
      horizontal_lines(7) + FOUR_WAY_JOIN + horizontal_lines(7) + \
      RIGHT_VERTICAL_JOIN + RETURN
  end

  def show_middle_row_with_numbers
    VERTICAL_LINE + spaces(3) + FOUR + spaces(3) + VERTICAL_LINE + \
      spaces(3) + FIVE + spaces(3) + VERTICAL_LINE + spaces(3) + \
      SIX + spaces(3) + VERTICAL_LINE + RETURN
  end

  def show_labeled_row(left_symbol, middle_symbol, right_symbol)
    VERTICAL_LINE + spaces(3) + left_symbol + spaces(3) + VERTICAL_LINE + \
      spaces(3) + middle_symbol + spaces(3) + VERTICAL_LINE + spaces(3) + \
      right_symbol + spaces(3) + VERTICAL_LINE + RETURN
  end

  def show_top_row_with_numbers
    VERTICAL_LINE + spaces(3) + ONE + spaces(3) + VERTICAL_LINE + \
      spaces(3) + TWO + spaces(3) + VERTICAL_LINE + spaces(3) + \
      THREE + spaces(3) + VERTICAL_LINE + RETURN
  end

  def show_row_with_spaces
    VERTICAL_LINE + spaces(7) + VERTICAL_LINE + spaces(7) + \
      VERTICAL_LINE + spaces(7) + VERTICAL_LINE + RETURN
  end

  def show_very_bottom_row
    BOTTOM_LEFT_CORNER + horizontal_lines(7) + BOTTOM_JOIN + \
      horizontal_lines(7) + BOTTOM_JOIN + horizontal_lines(7) + \
      BOTTOM_RIGHT_CORNER + RETURN
  end

  def show_very_top_row
    UPPER_LEFT_CORNER + horizontal_lines(7) + TOP_JOIN + horizontal_lines(7) + \
      TOP_JOIN + horizontal_lines(7) + UPPER_RIGHT_CORNER + RETURN
  end

end
