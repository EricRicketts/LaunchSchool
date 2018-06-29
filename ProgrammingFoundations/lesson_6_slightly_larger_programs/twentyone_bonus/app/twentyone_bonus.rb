require 'pry-byebug'
require_relative './playable.rb'

include Playable

loop do

  puts welcome

  deck, player_hand, player_tally, dealer_hand, dealer_tally = initialize_game
  present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
  player_score, dealer_score = total(player_hand), total(dealer_hand)
  player_busts, dealer_busts = false, false

  loop do
    response = prompt_player
    if response == :hit
      player_hand.merge!(deal_card(deck))
      player_score = total(player_hand)
      player_busts = busted?(player_score)
      present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
      display_player_busts_message if player_busts
    end
    break if response == :stay || player_busts
  end

  break
end
