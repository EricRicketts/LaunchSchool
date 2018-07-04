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

  def display_game_tally(game_tally)
    player = game_tally[:player].to_s
    dealer = game_tally[:dealer].to_s
    str = "Current tally:  Player #{player}, Dealer #{dealer}."
    puts prompt(str)
  end

  def display_one_score(player, score)
    str = player + " score is: " + "#{score}"
    puts prompt(str)
  end

  def display_round_results(round_winner, player_score, dealer_score)
    str1 = "Round score: Player #{player_score}, Dealer #{dealer_score}."
    case round_winner
    when :player_busts then str2 = "Player busts, Dealer wins!!"
    when :dealer_busts then str2 = "Dealer busts, Player wins!!"
    when :player then str2 = "Player wins!!"
    when :dealer then str2 = "Dealer wins!!"
    else str2 = "A tie!!"
    end
    display_score_and_winner(str1, str2)
  end

  def display_score_and_winner(str1, str2)
    puts prompt(str1)
    puts prompt(str2)
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

  def prompt(str)
    "=> " + str
  end

end
