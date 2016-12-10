module Board
  SPACE = "\u0020".freeze
  RETURN = "\n".freeze

  HORIZONTAL_LINE = "\u2550".freeze
  VERTICAL_LINE = "\u2551".freeze

  TOP_JOIN = "\u2566".freeze
  UPPER_LEFT_CORNER = "\u2554".freeze
  UPPER_RIGHT_CORNER = "\u2557".freeze

  ONE =   "\u0031".freeze
  TWO =   "\u0032".freeze
  THREE = "\u0033".freeze
  FOUR =  "\u0034".freeze
  FIVE =  "\u0035".freeze
  SIX =   "\u0036".freeze
  SEVEN = "\u0037".freeze
  EIGHT = "\u0038".freeze
  NINE =  "\u0039".freeze

  def show_top_board_row_with_numbers_in_each_square
    show_very_top_row + \
      show_row_with_spaces + \
      show_top_row_with_numbers + \
      show_row_with_spaces
  end

  def horizontal_lines(number)
    HORIZONTAL_LINE * number
  end

  def spaces(number)
    SPACE * number
  end

  def show_very_top_row
    UPPER_LEFT_CORNER + horizontal_lines(7) + TOP_JOIN + horizontal_lines(7) + \
      TOP_JOIN + horizontal_lines(7) + UPPER_RIGHT_CORNER + RETURN
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

end
