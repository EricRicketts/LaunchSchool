require_relative './dealable.rb'
require_relative './viewable.rb'
require_relative './scoreable.rb'

# rubocop:disable Metrics/ModuleLength
module Playable
  LARGEST_ALLOWABLE_SCORE = 21
  DEALER_STAY_VALUE = 17

  include Dealable
  include Viewable
  include Scoreable

  def dealer_exit(p_res, p_busts=false, d_stays=false, d_busts=false)
    p_res == :quit || p_busts || d_stays || d_busts
  end

  def display_dealer_hand_player_turn(dlr_hand)
    dealer_cards = make_dealer_cards_player_turn(dlr_hand)
    puts prompt("Dealer hand:")
    display_cards(dealer_cards)
  end

  def display_dealer_hand(dlr_hand, dlr_score)
    dealer_cards = make_cards(dlr_hand)
    puts prompt("Dealer hand:")
    display_cards(dealer_cards)
    display_one_score("Dealer", dlr_score)
  end

  def display_player_hand(plyr_hand, plyr_score, game_tally)
    player_cards = make_cards(plyr_hand)
    puts prompt("Player hand:")
    display_cards(player_cards)
    display_one_score("Player", plyr_score)
    display_game_tally("Current", game_tally)
  end

  def deal_initial_hands(deck, plyr_hand, dlr_hand)
    2.times do
      plyr_hand.merge!(deal_card(deck))
      dlr_hand.merge!(deal_card(deck))
    end
  end

  def dealer_hit(deck, dlr_hand, dlr_score)
    dealer_stay = dlr_score >= DEALER_STAY_VALUE &&
                  dlr_score <= LARGEST_ALLOWABLE_SCORE

    if dealer_stay
      dealer_stays = true
      dealer_busts = false
    elsif dlr_score > LARGEST_ALLOWABLE_SCORE
      dealer_stays = false
      dealer_busts = true
    else
      dlr_hand.merge!(deal_card(deck))
      dealer_stays = false
      dealer_busts = false
      dlr_score = total(dlr_hand)
    end

    [dlr_score, dealer_busts, dealer_stays]
  end

  def get_and_display_round_result(plyr_score, dlr_score, game_tally)
    round_result = return_round_result(plyr_score, dlr_score)
    display_round_results(round_result, plyr_score, dlr_score)
    update_tally(round_result, game_tally)
    display_game_tally("New", game_tally)
    winner = return_game_winner(game_tally)
    display_game_winner(winner) unless winner == :no_winner
  end

  def initialize_busts_hands_stays_and_response
    [{}, {}, false, false, false, nil]
  end

  def initialize_scores(plyr_hand, dlr_hand)
    [total(plyr_hand), total(dlr_hand)]
  end

  def make_cards(hand)
    cards = hand.keys
    cards.map do |card|
      if card.size == 3 # check for a "10"
        face = card[0..1]
        suit = card[2]
      else
        face = card[0]
        suit = card[1]
      end
      make_card(face, suit)
    end
  end

  # rubocop:disable Lint/UselessAssignment
  def make_dealer_cards_player_turn(dlr_hand)
    display_card, *rest = make_cards(dlr_hand)
    [display_card, blank_card]
  end
  # rubocop:enable Lint/UselessAssignment

  def pause_dealer_turn(dlr_stays, dlr_busts)
    puts prompt("Dealer hits!!") unless dlr_stays || dlr_busts
    puts prompt("Dealer stays!!") if dlr_stays
    puts prompt("Dealer busts!!") if dlr_busts
    loop do
      puts prompt("Show next dealer hit or move to end of round? (y)es")
      advance = gets.downcase.chomp
      break if ['y', 'yes'].include?(advance)
      puts prompt("Incorrect response, please try again.")
    end
  end

  def play_again?
    str = "Would you like to play a new game?((y)es or (n)o)"
    response = ''
    loop do
      puts prompt(str)
      response = gets.downcase.chomp
      break if ['n', 'no', 'y', 'yes'].include?(response)
      puts prompt("Incorrect response.  Let's try again.")
    end
    response
  end

  def player_exit(player_response, player_busts)
    [:quit, :stay].include?(player_response) || player_busts
  end

  def player_hit(deck, plyr_hand)
    plyr_hand.merge!(deal_card(deck))
    plyr_score = total(plyr_hand)
    player_busts = busted?(plyr_score)
    [plyr_score, player_busts]
  end

  def present_hands_dealer_turn(plyr_hand, plyr_score, dlr_hand,
                                dlr_score, game_tally)
    display_dealer_hand(dlr_hand, dlr_score)
    display_player_hand(plyr_hand, plyr_score, game_tally)
  end

  def present_hands_player_turn(plyr_hand, dlr_hand, plyr_score, game_tally)
    display_dealer_hand_player_turn(dlr_hand)
    display_player_hand(plyr_hand, plyr_score, game_tally)
  end

  def prompt_player
    prompt_str = "Would you like to (h)it, (s)tay, or (q)uit?"
    response = ''
    valid_response_ary = ['h', 'hit', 'q', 'quit', 's', 'stay']
    loop do
      puts prompt(prompt_str)
      response = gets.downcase.chomp
      break if valid_response_ary.include?(response)
      puts prompt("Incorrect response. Let's try again.")
    end
    case response
    when 'h', 'hit' then :hit
    when 's', 'stay' then :stay
    else :quit
    end
  end

  def welcome_message
    str1 = "Welcome To The Game Of Twenty One!!"
    str2 = "Each game consists of 5 rounds between the dealer and the player."
    str3 = "First to 5 wins the game."
    str4 = "Let's start!!"
    ary = [str1, str2, str3, str4]
    ary.each { |str| prompt(str) }
  end
end
# rubocop:enable Metrics/ModuleLength
