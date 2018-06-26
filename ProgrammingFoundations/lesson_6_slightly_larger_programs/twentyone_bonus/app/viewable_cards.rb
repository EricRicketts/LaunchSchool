require 'pry-byebug'
module ViewableCards
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
    "C" => CLUB, "D" => DIAMOND, "H" => HEART, "S" => SPADE
  }.freeze

  def make_card(face, suite)
    width_with_face = INTERIOR_WIDTH - face.size
    width_with_suite = INTERIOR_WIDTH - suite.size
    # TOP_LEFT + HORIZONTAL_LINE * INTERIOR_WIDTH + TOP_RIGHT + "\n" +
    # VERTICAL_LINE + face + SPACE * width_with_face + VERTICAL_LINE + "\n" +

    # VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +
    # VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +
    # VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +

    # VERTICAL_LINE + SPACE * HALF_WIDTH + SUITE_HASH[suite] + SPACE * HALF_WIDTH + VERTICAL_LINE + "\n"  +

    # VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +
    # VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +
    # VERTICAL_LINE + SPACE * INTERIOR_WIDTH + VERTICAL_LINE + "\n" +

    # VERTICAL_LINE + SPACE * width_with_face + face + VERTICAL_LINE + "\n" +
    # BOTTOM_LEFT + HORIZONTAL_LINE * INTERIOR_WIDTH + BOTTOM_RIGHT + "\n"
    compose_top(face, width_with_face) + compose_middle(suite) +
    compose_bottom(face, width_with_face)

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
    VERTICAL_LINE + SPACE * HALF_WIDTH + SUITE_HASH[suite] + SPACE * HALF_WIDTH + VERTICAL_LINE + "\n"
  end

  def compose_top(face, width_with_face)
    TOP_LEFT + HORIZONTAL_LINE * INTERIOR_WIDTH + TOP_RIGHT + "\n" +
    VERTICAL_LINE + face + SPACE * width_with_face + VERTICAL_LINE + "\n" +
    compose_empty_region  
  end

  def display_cards(cards)
    strings = cards.map {|card| card.each_line.to_a} 
    first, *rest = *strings
    initial_side_by_side = first.zip(*rest)
    final_side_by_side = initial_side_by_side.map do |row|
      row.map do |str|
        str.gsub(/\n/, ' ')
      end
    end
    final_side_by_side.each do |row|
      row.each do |str|
        print str
      end
      print "\n"
    end
  end

end

include ViewableCards
cards = [make_card("8", "S"), make_card("10", "H"), make_card("J", "D")]
display_cards(cards)