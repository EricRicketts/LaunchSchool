require_relative './dealable.rb'
require_relative './viewable.rb'
require_relative './scoreable.rb'

module Playable
  include Dealable
  include Viewable
  include Scoreable

  def display_initial_dealer_hand(dealer_hand)
    dealer_cards = make_dealer_cards_with_one_hidden(dealer_hand)
    puts prompt("Dealer hand:")
    display_cards(dealer_cards)
  end

  def display_player_busts_message
    puts prompt("Oops!! Player score greater than 21!!  Dealer wins the round!!")
  end

  def display_player_hand(player_hand)
    player_cards = make_cards(player_hand)
    puts prompt("Player hand:")
    display_cards(player_cards)
    puts display_player_score(player_hand)
  end

  def display_player_score(player_hand)
    prompt("Player score is: #{total(player_hand)}")
  end

  def make_dealer_cards_with_one_hidden(dealer_hand)
    dealer_hand_ary = dealer_hand.to_a

    first_face = dealer_hand_ary.first.first[0]
    first_suit = dealer_hand_ary.first.first[1]
    first_card = make_card(first_face, first_suit)

    [first_card, blank_card]
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

  def initialize_game
    deck = create_deck
    shuffled_deck = shuffle_deck(deck)
    player_hand, dealer_hand = {}, {}
    player_tally = { player: 0 }
    dealer_tally = { dealer: 0 }

    2.times do
      player_hand.merge!(deal_card(shuffled_deck))
      dealer_hand.merge!(deal_card(shuffled_deck))
    end
    [shuffled_deck, player_hand, player_tally, dealer_hand, dealer_tally]
  end

  def present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
    system('clear')
    display_initial_dealer_hand(dealer_hand)
    display_player_hand(player_hand)
  end

  def prompt(str)
    "=> " + str
  end

  def prompt_player
    prompt_str = "Would you like to (h)it or (s)tay?"
    response = ''
    loop do
      puts prompt(prompt_str)
      response = gets.downcase.chomp
      response = response[0]
      break if ['h', 's'].include?(response)
      puts prompt("Incorrect response. Let's try again.")
    end
    response == "h" ? :hit : :stay
  end

  def welcome
    prompt("Welcome To The Game Of Twenty One!!")
  end

end
