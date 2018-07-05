require 'pry-byebug'
require_relative './playable.rb'

include Playable

loop do # play loop

  welcome_message
  game_tally = initialize_game_tally
  global_quit = nil

  loop do # game loop

    deck = initialize_deck
    player_hand, dealer_hand = initialize_hands

    start_round(deck, player_hand, dealer_hand)
    player_score, dealer_score = start_scoring(player_hand, dealer_hand)
    player_busts, dealer_busts = false, false
    dealer_stays, player_response = false, nil

    new_round_message
    present_hands_player_turn(player_hand, dealer_hand, player_score)

    until player_exit(player_response, player_busts)
      player_response = prompt_player
      if player_response == :hit
        player_score, player_busts = player_hit(deck, player_hand)
        present_hands_player_turn(player_hand, dealer_hand, player_score)
      end
      dealer_score = total(dealer_hand)
    end

    until dealer_exit(player_response, player_busts, dealer_stays, dealer_busts)
      present_hands_dealer_turn(player_hand, player_score, dealer_hand, dealer_score)
      dealer_score, dealer_busts, dealer_stays = dealer_hit(deck, dealer_hand)
      puts prompt("Dealer hits!!") unless dealer_stays || dealer_busts
    end

    if player_response == :quit
      global_quit = player_response
      break
    end
    round_result = return_round_result(player_score, dealer_score)
    display_round_results(round_result, player_score, dealer_score)
    update_tally(round_result, game_tally)
    display_game_tally(game_tally)

    break if game_over?(game_tally)

  end # game loop

  break if global_quit == :quit || play_again? == 'n'

end # play loop
