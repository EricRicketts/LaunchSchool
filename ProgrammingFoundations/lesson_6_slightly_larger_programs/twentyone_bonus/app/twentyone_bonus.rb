require_relative './playable.rb'

include Playable

loop do # play loop
  welcome_message
  game_tally = initialize_game_tally
  global_quit = nil

  loop do # game loop
    plyr_hand, dlr_hand, *rest = initialize_busts_hands_stays_and_response
    plyr_busts, dlr_busts, dlr_stays, plyr_response = rest

    deck = initialize_deck
    deal_initial_hands(deck, plyr_hand, dlr_hand)
    plyr_score, dlr_score = initialize_scores(plyr_hand, dlr_hand)

    new_round_message
    present_hands_player_turn(plyr_hand, dlr_hand, plyr_score, game_tally)

    until player_exit(plyr_response, plyr_busts)
      plyr_response = prompt_player
      if plyr_response == :hit
        plyr_score, plyr_busts = player_hit(deck, plyr_hand)
        present_hands_player_turn(plyr_hand, dlr_hand, plyr_score, game_tally)
      end
      dlr_score = total(dlr_hand)
    end

    until dealer_exit(plyr_response, plyr_busts, dlr_stays, dlr_busts)
      present_hands_dealer_turn(plyr_hand, plyr_score, dlr_hand,
                                dlr_score, game_tally)
      dlr_score, dlr_busts, dlr_stays = dealer_hit(deck, dlr_hand, dlr_score)
      pause_dealer_turn(dlr_stays, dlr_busts)
    end

    if plyr_response == :quit
      global_quit = plyr_response
      break
    end

    get_and_display_round_result(plyr_score, dlr_score, game_tally)

    break if game_over?(game_tally)
  end

  break if global_quit == :quit || ['n', 'no'].include?(play_again?)
end
