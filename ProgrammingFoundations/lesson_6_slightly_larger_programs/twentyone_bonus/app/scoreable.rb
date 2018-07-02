module Scoreable

  def busted?(score)
    score > 21
  end

  def total(cards)
    sum = cards.values.sum
    aces = cards.select { |card, _| card[0] == "A" }
    return sum if aces.empty?
    aces.each do |ace, value|
      if sum > 21
        cards[ace] = value - 10 unless value == 1
        sum = cards.values.sum
      end
    end
    sum
  end

  def display_current_tally(game_tally)
    player_tally = game_tally[:player]
    dealer_tally = game_tally[:dealer]

    str = "=> Current game score:\n" +
      "=> Player: #{player_tally} Dealer: #{dealer_tally}\n"
    puts str
  end

  def display_round_results(round_results, player_score, dealer_score)
    score_str = "Player score: #{player_score}, Dealer score: #{dealer_score}."
    hsh = {
      player_busts: "Player busts!!  Dealer wins!!",
      dealer_busts: "Dealer busts!!  Player wins!!",
      player: score_str + "  Player wins!!",
      dealer: score_str + "  Dealer wins!!",
      tie: score_str + "  A tie!!"
    }
    hsh[round_results]
  end

  def display_winner(winner)
    case winner
    when :player_wins
      puts "=> Player wins the game!!"
    when :dealer_wins
      puts "=> Dealer wins the game!!"
    end
  end

  def return_round_results_no_bust(player_score, dealer_score)
    case
    when player_score > dealer_score then :player
    when dealer_score > player_score then :dealer
    else :tie
    end
  end

  def return_winner(game_tally)
    case
    when game_tally[:player] == 5 then :player_wins
    when game_tally[:dealer] == 5 then :dealer_wins
    else :no_winner
    end
  end

  def update_tally(round_result, game_tally)
    case round_result
    when :dealer_busts, :player then game_tally[:player] += 1
    when :player_busts, :dealer then game_tally[:dealer] += 1
    else game_tally
    end
  end
end
