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

  def display_results(round_results, player_score, dealer_score)
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

  def return_winner(player_score, dealer_score)
    case
    when busted?(player_score) then :player_busts
    when busted?(dealer_score) then :dealer_busts
    when player_score > dealer_score then :player
    when dealer_score > player_score then :dealer
    else :tie
    end
  end

  def update_tally(round_result, player_tally, dealer_tally)
    case round_result
    when :dealer_busts, :player then player_tally[:player] += 1
    when :player_busts, :dealer then dealer_tally[:dealer] += 1
    end
  end
end
