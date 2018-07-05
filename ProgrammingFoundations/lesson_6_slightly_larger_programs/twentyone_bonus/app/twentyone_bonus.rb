require 'pry-byebug'
require_relative './playable.rb'

include Playable

loop do # play loop

  welcome_message
  game_tally = initialize_game_tally
  global_quit = nil

  loop do # game loop

    deck = initialize_deck
    plyr_hand, dlr_hand = initialize_hands

    start_round(deck, plyr_hand, dlr_hand)
    plyr_score, dlr_score = start_scoring(plyr_hand, dlr_hand)
    plyr_busts, dlr_busts, dlr_stays, plyr_response = false, false, false, nil

    new_round_message
    present_hands_player_turn(plyr_hand, dlr_hand, plyr_score)

    until player_exit(plyr_response, plyr_busts)
      plyr_response = prompt_player
      if plyr_response == :hit
        plyr_score, plyr_busts = player_hit(deck, plyr_hand)
        present_hands_player_turn(plyr_hand, dlr_hand, plyr_score)
      end
      dlr_score = total(dlr_hand)
    end

    until dealer_exit(plyr_response, plyr_busts, dlr_stays, dlr_busts)
      present_hands_dealer_turn(plyr_hand, plyr_score, dlr_hand, dlr_score)
      dlr_score, dlr_busts, dlr_stays = dealer_hit(deck, dlr_hand)
      puts prompt("Dealer hits!!") unless dlr_stays || dlr_busts
    end

    if plyr_response == :quit
      global_quit = plyr_response
      break
    end
    round_result = return_round_result(plyr_score, dlr_score)
    display_round_results(round_result, plyr_score, dlr_score)
    update_tally(round_result, game_tally)
    display_game_tally(game_tally)

    break if game_over?(game_tally)

  end # game loop

  break if global_quit == :quit || play_again? == 'n'

end # play loop
