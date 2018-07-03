require_relative './dealable.rb'
require_relative './viewable.rb'
require_relative './scoreable.rb'

module Playable
  include Dealable
  include Viewable
  include Scoreable

  def initialize_hands
    [{}, {}]
  end
  # def declare_winner_deck_empty(game_tally)
  #   player_tally = game_tally[:player]
  #   dealer_tally = game_tally[:dealer]
  #   str = "Deck is empty!!  Current game score: Player #{player_tally}, " +
  #     "Dealer #{dealer_tally}.  "
  #   if player_tally > dealer_tally
  #     str += "Player wins!!"
  #     puts prompt(str)
  #   elsif dealer_tally > player_tally
  #     str += "Dealer wins!!"
  #     puts prompt(str)
  #   else
  #     str += "A tie!!"
  #     puts prompt(str)
  #   end
  # end

  # def display_initial_dealer_hand(dealer_hand)
  #   dealer_cards = make_dealer_cards_with_one_hidden(dealer_hand)
  #   puts prompt("Dealer hand:")
  #   display_cards(dealer_cards)
  # end

  # def display_dealer_hand(dealer_hand)
  #   dealer_cards = make_cards(dealer_hand)
  #   puts prompt("Dealer hand:")
  #   display_cards(dealer_cards)
  #   puts display_dealer_score(dealer_hand)
  # end

  # def display_busts_message(who_busts)
  #   if :player_busts
  #     puts prompt("Oops!! Player score greater than 21!!  Dealer wins the round!!")
  #   else
  #     puts prompt("Oops!! Dealer score greater than 21!!  Player wins the round!!")
  #   end
  # end

  # def display_player_hand(player_hand)
  #   player_cards = make_cards(player_hand)
  #   puts prompt("Player hand:")
  #   display_cards(player_cards)
  #   puts display_player_score(player_hand)
  # end

  # def display_dealer_score(dealer_hand)
  #   dealer_score = total(dealer_hand)
  #   if dealer_score >= 17 && dealer_score <=21
  #     puts prompt("Dealer stays at #{dealer_score}.")
  #   elsif dealer_score > 21
  #     puts prompt("Dealer score is: #{dealer_score}, Dealer busts, Player wins the round!!")
  #   else
  #     puts prompt("Dealer score is: #{total(dealer_hand)}")
  #   end
  # end

  # def display_player_score(player_hand)
  #   player_score = total(player_hand)
  #   if player_score <= 21
  #     prompt("Player score is: #{player_score}")
  #   else
  #     prompt("Player score is: #{player_score}, Player busts, Dealer wins the round!!")
  #   end
  # end

  # def display_round_winner(winner, game_tally)
  #   current_player_tally = game_tally[:player]
  #   current_dealer_tally = game_tally[:dealer]
  #   case winner
  #   when :player
  #     puts prompt("Player wins the round!!")
  #   when :dealer
  #     puts prompt("Dealer wins the round!!")
  #   else
  #     puts prompt("A tie!!")
  #   end
  #   str = "Current game score: " +
  #     "Player: #{current_player_tally} " +
  #     "Dealer: #{current_dealer_tally}"
  #   puts prompt(str)
  # end

  # def display_stay_message(score)
  #   puts prompt("Player stays at #{score}.")
  # end

  # def do_dealer_hit(deck, dealer_hand)
  #   dealer_score = total(dealer_hand)
  #   if dealer_score >= 17 && dealer_score <= 21
  #     dealer_stay = true
  #     dealer_bust = false
  #   elsif dealer_score > 21
  #     dealer_stay = true
  #     dealer_bust = true
  #   else
  #     dealer_hand.merge!(deal_card(deck))
  #     dealer_stay = false
  #     dealer_bust = false
  #   end
  #   [dealer_score, dealer_bust, dealer_stay]
  # end

  # def do_bust(who_busts, game_tally)
  #   update_tally(who_busts, game_tally)
  #   display_current_tally(game_tally)
  # end

  # def do_player_hit(deck, player_hand)
  #   player_hand.merge!(deal_card(deck))
  #   player_score = total(player_hand)
  #   [player_score, busted?(player_score)]
  # end

  # def game_over?(game_tally)
  #   game_tally.values.include?(5)
  # end

  # def get_round_winner(player_hand, dealer_hand)
  #   player_score = total(player_hand)
  #   dealer_score = total(dealer_hand)
  #   if player_score > dealer_score
  #     :player
  #   elsif dealer_score > player_score
  #     :dealer
  #   else
  #     :tie
  #   end
  # end

  # def make_dealer_cards_with_one_hidden(dealer_hand)
  #   dealer_hand_ary = dealer_hand.to_a
  #   first_card, *rest = make_cards(dealer_hand)

  #   [first_card, blank_card]
  # end

  # def make_cards(hand)
  #   cards = hand.keys
  #   display_cards = cards.map do |card|
  #     if card.size == 3 # check for a "10"
  #       face = card[0..1]
  #       suit = card[2]
  #     else
  #       face, suit = card[0], card[1]
  #     end
  #     make_card(face, suit)
  #   end
  # end

  # def init_game(deck)
  #   player_hand, dealer_hand = {}, {}
  #   game_tally = { player: 0, dealer: 0 }

  #   2.times do
  #     player_hand.merge!(deal_card(deck))
  #     dealer_hand.merge!(deal_card(deck))
  #   end

  #   [player_hand, dealer_hand, game_tally] +
  #     [total(player_hand), total(dealer_hand), false, false]
  # end

  # def initialize_scores_and_busts(player_hand, dealer_hand)
  #   [total(player_hand), total(dealer_hand), false, false]
  # end

  # def present_hands(player_hand, dealer_hand)
  #   display_dealer_hand(dealer_hand)
  #   display_player_hand(player_hand)
  # end

  # def present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
  #   display_initial_dealer_hand(dealer_hand)
  #   display_player_hand(player_hand)
  # end

  def prompt(str)
    "=> " + str
  end

  # def prompt_continue_play
  #   prompt_str = "Would like to continue playing, (y)es or (n)o?"
  #   response = ''
  #   loop do
  #     puts prompt(prompt_str)
  #     response = gets.downcase.chomp
  #     response = response[0]
  #     break if ['y', 'n'].include?(response)
  #     puts prompt("Incorrect response.  Let's try again.")
  #   end
  #   response == 'y'
  # end

  # def prompt_player
  #   prompt_str = "Would you like to (h)it, (s)tay, or (q)uit?"
  #   response = ''
  #   loop do
  #     puts prompt(prompt_str)
  #     response = gets.downcase.chomp
  #     response = response[0]
  #     break if ['h', 'q', 's'].include?(response)
  #     puts prompt("Incorrect response. Let's try again.")
  #   end
  #   case response
  #   when 'h' then :hit
  #   when 's' then :stay
  #   else :quit
  #   end
  # end

  def welcome
    str1 = "Welcome To The Game Of Twenty One!!"
    str2 = "Each game consists of 5 rounds between the dealer and the player."
    str3 = "First to 5 wins the game."
    str4 = "Let's start!!"
    ary = [str1, str2, str3, str4]
    ary.each { |str| puts prompt(str) }
  end

end
