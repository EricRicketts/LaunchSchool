module Viewable
  HORIZONTAL_LINE = "\u2550".freeze
  VERTICAL_LINE = "\u2551".freeze
  TOP_LEFT = "\u2554".freeze
  TOP_RIGHT = "\u2557".freeze
  BOTTOM_RIGHT = "\u255d".freeze
  BOTTOM_LEFT = "\u255a".freeze

  SPACE = "\u0020".freeze
  INTERIOR_WIDTH = 11
  HALF_WIDTH = 5

  SPADE = "\u2664".freeze
  HEART = "\u2661".freeze
  DIAMOND = "\u2662".freeze
  CLUB = "\u2667".freeze

  SUITE_HASH = {
    "C" => CLUB, "D" => DIAMOND, "H" => HEART, "S" => SPADE, "\s" => SPACE
  }.freeze

  def blank_card
    make_card("\s", "\s")
  end

  def compose_bottom(face, width_with_face)
    compose_empty_region +
      VERTICAL_LINE + SPACE * width_with_face + face + VERTICAL_LINE + "\n" +
      BOTTOM_LEFT + HORIZONTAL_LINE * INTERIOR_WIDTH + BOTTOM_RIGHT + "\n"
  end

  def compose_empty_region
    VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +
      VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +
      VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n"
  end

  def compose_middle(suite)
    VERTICAL_LINE + SPACE * HALF_WIDTH + SUITE_HASH[suite] +
      SPACE * HALF_WIDTH + VERTICAL_LINE + "\n"
  end

  def compose_top(face, width_with_face)
    TOP_LEFT + HORIZONTAL_LINE * INTERIOR_WIDTH + TOP_RIGHT + "\n" +
      VERTICAL_LINE + face + SPACE * width_with_face + VERTICAL_LINE + "\n" +
      compose_empty_region
  end

  def convert_cards_to_rows_of_strings(cards)
    strings = cards.map { |card| card.each_line.to_a }
    first, *rest = *strings

    first.zip(*rest).map do |row| # swap out eol for a space
      row.map do |str|
        str.tr("\n", SPACE)
      end
    end
  end

  def display_cards(cards)
    rows_of_strings = convert_cards_to_rows_of_strings(cards)
    print_rows_of_strings(rows_of_strings)
  end

  def make_card(face, suite)
    width_with_face = INTERIOR_WIDTH - face.size

    compose_top(face, width_with_face) + compose_middle(suite) +
      compose_bottom(face, width_with_face)
  end

  def print_rows_of_strings(rows_of_strings)
    rows_of_strings.each do |row|
      row.each do |str|
        print str
      end
      print "\n"
    end
  end
end

# include Viewable
# card1 = make_card("2", "D")
# card2 = blank_card
# card3 = make_card("10", "C")
# card4 = make_card("10", "H")
# card5 = blank_card
# card6 = make_card("A", "C")
# card7 = make_card("2", "C")
# card8 = blank_card
# card9 = make_card("10", "D")
# card10 = make_card("10", "S")
# card11 = blank_card
# card12 = make_card("3", "S")
# display_cards([card1, card2, card3, card4, card5, card6, card7, card8, card9, card10, card11, card12])
