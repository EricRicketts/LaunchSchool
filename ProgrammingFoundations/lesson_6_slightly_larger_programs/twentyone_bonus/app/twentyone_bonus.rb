require 'pry-byebug'
require_relative './playable.rb'

include Playable

welcome

loop do # game loop

  deck, player_hand, player_tally, dealer_hand, dealer_tally, *rest = init_game
  player_score, dealer_score, player_bust, dealer_bust = *rest
  present_hands_one_dealer_card_hidden(player_hand, dealer_hand)

  loop do # player loop

    response = prompt_player

    if response == :hit
      player_score, player_bust = do_player_hit(deck, player_hand)
      present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
      do_bust(:player_busts, player_tally, dealer_tally) if player_bust
    end

    display_stay_message(player_score) if response == :stay
    break if response == :stay || player_bust

  end

    next if player_bust

  loop do # dealer loop

    present_hands(player_hand, dealer_hand)
    dealer_score, dealer_bust, dealer_stay = do_dealer_hit(deck, dealer_hand)
    puts prompt("Dealer hits!!") if !dealer_stay
    do_bust(:dealer_busts, player_tally, dealer_tally) if dealer_bust

    break if dealer_stay || dealer_bust

  end

  break
end
