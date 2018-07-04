require_relative './dealable.rb'
require_relative './viewable.rb'
require_relative './scoreable.rb'
require 'pry-byebug'

module Playable
  include Dealable
  include Viewable
  include Scoreable

  def initialize_hands
    [{}, {}]
  end

  def display_dealer_hand_player_turn(dealer_hand)
    dealer_cards = make_dealer_cards_player_turn(dealer_hand)
    puts prompt("Dealer hand:")
    display_cards(dealer_cards)
  end

  def display_dealer_hand(dealer_hand, dealer_score)
    dealer_cards = make_cards(dealer_hand)
    puts prompt("Dealer hand:")
    display_cards(dealer_cards)
    display_one_score("Dealer", dealer_score)
  end

  def display_player_hand(player_hand, player_score)
    player_cards = make_cards(player_hand)
    puts prompt("Player hand:")
    display_cards(player_cards)
    display_one_score("Player", player_score)
  end

  def dealer_exit(p_res, p_busts=false, d_stays=false, d_busts=false)
    p_res == :quit || p_busts || d_stays || d_busts
  end

  def dealer_hit(deck, dealer_hand)
    dealer_score = total(dealer_hand)
    if dealer_score >= 17 && dealer_score <= 21
      dealer_stays, dealer_busts = true, false
    elsif dealer_score > 21
      dealer_stays, dealer_busts = false, true
    else
      dealer_hand.merge!(deal_card(deck))
      dealer_stays, dealer_busts = false, false
      dealer_score = total(dealer_hand)
    end
    [dealer_score, dealer_busts, dealer_stays]
  end

  def player_hit(deck, player_hand)
    player_hand.merge!(deal_card(deck))
    player_score = total(player_hand)
    player_busts = busted?(player_score)
    [player_score, player_busts]
  end

  def make_cards(hand)
    cards = hand.keys
    display_cards = cards.map do |card|
      if card.size == 3 # check for a "10"
        face = card[0..1]
        suit = card[2]
      else
        face, suit = card[0], card[1]
      end
      make_card(face, suit)
    end
  end

  def make_dealer_cards_player_turn(dealer_hand)
    dealer_hand_ary = dealer_hand.to_a
    first_card, *rest = make_cards(dealer_hand)
    [first_card, blank_card]
  end

  def player_exit(player_response, player_busts)
    [:quit, :stay].include?(player_response) || player_busts
  end

  def present_hands_dealer_turn(player_hand, player_score, dealer_hand, dealer_score)
    display_dealer_hand(dealer_hand, dealer_score)
    display_player_hand(player_hand, player_score)
  end

  def new_round_message
    puts prompt("A new round begins!!")
  end

  def present_hands_player_turn(player_hand, dealer_hand, player_score)
    display_dealer_hand_player_turn(dealer_hand)
    display_player_hand(player_hand, player_score)
  end

  def prompt(str)
    "=> " + str
  end

  def start_round(deck, player_hand, dealer_hand)
    2.times do
      player_hand.merge!(deal_card(deck))
      dealer_hand.merge!(deal_card(deck))
    end
  end

  def start_scoring(player_hand, dealer_hand)
    [total(player_hand), total(dealer_hand)]
  end

  def prompt_player
    prompt_str = "Would you like to (h)it, (s)tay, or (q)uit?"
    response = ''
    loop do
      puts prompt(prompt_str)
      response = gets.downcase.chomp
      response = response[0]
      break if ['h', 'q', 's'].include?(response)
      puts prompt("Incorrect response. Let's try again.")
    end
    case response
    when 'h' then :hit
    when 's' then :stay
    when 'q' then :quit
    else nil
    end
  end

  def welcome_message
    str1 = "Welcome To The Game Of Twenty One!!"
    str2 = "Each game consists of 5 rounds between the dealer and the player."
    str3 = "First to 5 wins the game."
    str4 = "Let's start!!"
    ary = [str1, str2, str3, str4]
    ary.each { |str| puts prompt(str) }
  end

end
