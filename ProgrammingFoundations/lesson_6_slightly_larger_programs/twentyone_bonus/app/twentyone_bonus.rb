require 'pry-byebug'
require_relative './playable.rb'

include Playable

welcome

loop do # game loop

  deck = initialize_deck
  player_hand, dealer_hand = initialize_hands
  game_tally = initialize_game_tally

  loop do # round loop

    start_round(deck, player_hand, dealer_hand)
    player_score, dealer_score = start_scoring(player_hand, dealer_hand)
    new_round_message
    present_hands_player_turn(player_hand, dealer_hand, player_score)
    player_busts, dealer_busts = false, false
    dealer_stays, player_response = false, nil
    player_exit, dealer_exit = false, false

    until player_exit
      player_response = prompt_player
      if player_response == :hit
        player_score, player_busts = player_hit(deck, player_hand)
        present_hands_player_turn(player_hand, dealer_hand, player_score)
      end
      player_exit = update_player_exit(player_response, player_busts)
      dealer_exit = update_dealer_exit(player_response, player_busts)
      dealer_score = total(dealer_hand)
    end

    until dealer_exit
      present_hands_dealer_turn(player_hand, player_score, dealer_hand, dealer_score)
      dealer_score, dealer_busts, dealer_stays = dealer_hit(deck, dealer_hand)
      puts prompt("Dealer hits!!") if !dealer_stays
      dealer_exit = update_dealer_exit(player_response, player_busts, dealer_stays, dealer_busts)
    end
    # loop do # player loop

    #   player_response = prompt_player

    #   if player_response == :hit
    #     player_score, player_busts = player_hit(deck, player_hand)
    #     present_hands_player_turn(player_hand, dealer_hand, player_score)
    #   end

    #   break if [:stay, :quit].include?(player_response) || player_busts

    # end # player loop


    round_result = return_round_result(player_score, dealer_score)
    update_tally(round_result, game_tally)
    display_game_tally(game_tally)
    break
  end # round loop

  break
end # game loop

# loop do # game loop

#   welcome

#   continue_play = true
#   response = :quit
#   game_tally = { player: 0, dealer: 0 }

#   # binding.pry # play loop

#   loop do # round loop

#     # binding.pry # game loop

#     deck_unshuffled = create_deck
#     deck = shuffle_deck(deck_unshuffled)
#     player_hand, dealer_hand = {}, {}

#     puts "Deck size: #{deck.size}"
#     2.times do
#       player_hand.merge!(deal_card(deck))
#       dealer_hand.merge!(deal_card(deck))
#     end

#     player_score, dealer_score = total(player_hand), total(dealer_hand)
#     player_bust, dealer_bust = false, false

#     puts prompt("A new round!!")
#     present_hands_one_dealer_card_hidden(player_hand, dealer_hand)

#     loop do # player loop

#       # binding.pry # player loop
#       puts "Deck size: #{deck.size}"
#       p dealer_hand
#       puts
#       response = prompt_player

#       if response == :hit
#         player_score, player_bust = do_player_hit(deck, player_hand)
#         present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
#         if player_bust
#           update_tally(:player_busts, game_tally)
#           display_current_tally(game_tally)
#         end
#       end


#       display_stay_message(player_score) if response == :stay
#       break if response == :stay || response == :quit || player_bust

#     end # player_loop

#     # binding.pry # game loop right after player loop

#     break if response == :quit || !continue_play

#     if game_over?(game_tally)
#       winner = return_winner(game_tally)
#       display_winner(winner)
#       continue_play = prompt_continue_play
#     end

#     break if !continue_play
#     next if player_bust

#     loop do # dealer loop

#       # binding.pry # dealer loop

#       puts "Deck size: #{deck.size}"
#       present_hands(player_hand, dealer_hand)
#       dealer_score, dealer_bust, dealer_stay = do_dealer_hit(deck, dealer_hand)
#       puts prompt("Dealer hits!!") if !dealer_stay
#       do_bust(:dealer_busts, game_tally) if dealer_bust


#       break if dealer_stay || dealer_bust

#     end # dealer loop

#     binding.pry # game loop right after dealer loop

#     if !game_over?(game_tally) && !dealer_bust
#       winner = return_round_results_no_bust(player_score, dealer_score)
#       update_tally(winner, game_tally)
#       display_round_winner(winner, game_tally)
#     end

#     # next if dealer_bust && !game_over?(game_tally)

#     if game_over?(game_tally)
#       winner = return_winner(game_tally)
#       display_winner(winner)
#       continue_play = prompt_continue_play
#     end

#     break if !continue_play
#   end # round loop

#   break if response == :quit || !continue_play
#   next if continue_play

# end # game loop
