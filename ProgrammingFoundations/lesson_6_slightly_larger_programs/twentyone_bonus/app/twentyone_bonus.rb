require 'pry-byebug'
require_relative './playable.rb'

include Playable

welcome

deck_unshuffled = create_deck
deck = shuffle_deck(deck_unshuffled)

game_tally = { player: 0, dealer: 0 }

loop do # game loop

  player_hand, dealer_hand = {}, {}

  2.times do
      player_hand.merge!(deal_card(deck))
      dealer_hand.merge!(deal_card(deck))
  end

  puts "Deck size: #{deck.size}"
  player_score, dealer_score = total(player_hand), total(dealer_hand)
  player_bust, dealer_bust = false, false

  puts prompt("A new round!!")
  present_hands_one_dealer_card_hidden(player_hand, dealer_hand)

  loop do # player loop

    response = prompt_player

    if response == :hit
      player_score, player_bust = do_player_hit(deck, player_hand)
      present_hands_one_dealer_card_hidden(player_hand, dealer_hand)
      if player_bust
        update_tally(:player_busts, game_tally)
        display_current_tally(game_tally)
      end
    end

    display_stay_message(player_score) if response == :stay
    break if response == :stay || player_bust

  end

  if game_over?(game_tally)
    winner = return_winner(game_tally)
    display_winner(winner)
    break
  end

  next if player_bust

  loop do # dealer loop

    present_hands(player_hand, dealer_hand)
    dealer_score, dealer_bust, dealer_stay = do_dealer_hit(deck, dealer_hand)
    puts prompt("Dealer hits!!") if !dealer_stay
    do_bust(:dealer_busts, game_tally) if dealer_bust

    break if dealer_stay || dealer_bust

  end

  if !game_over?(game_tally) && !dealer_bust
    winner = return_round_results_no_bust(player_score, dealer_score)
    update_tally(winner, game_tally)
    display_round_winner(winner, game_tally)
  end

  next if dealer_bust && !game_over?(game_tally)

  if game_over?(game_tally)
    winner = return_winner(game_tally)
    display_winner(winner)
    break
  end

end
