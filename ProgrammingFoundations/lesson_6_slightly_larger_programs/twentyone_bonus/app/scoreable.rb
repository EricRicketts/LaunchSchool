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

  def return_winner(player_score, dealer_score)
    # score_str = "Player score: #{player_score}, Dealer score: #{dealer_score}."
    # case
    # when busted?(player_score)
    #   dealer_tally[:dealer] += 1
    #   "Player busts!!  Dealer wins!!"
    # when busted?(dealer_score)
    #   player_tally[:player] += 1
    #   "Dealer busts!!  Player wins!!"
    # when player_score > dealer_score
    #   player_tally[:player] += 1
    #   score_str + "  Player wins!!"
    # when dealer_score > player_score
    #   dealer_tally[:dealer] += 1
    #   score_str + "  Dealer wins!!"
    # else
    #   score_str + "  A tie!!"
    # end
    case
    when busted?(player_score) then :player_busts
    when busted?(dealer_score) then :dealer_busts
    when player_score > dealer_score then :player
    when dealer_score > player_score then :dealer
    else :tie
    end
  end
end
