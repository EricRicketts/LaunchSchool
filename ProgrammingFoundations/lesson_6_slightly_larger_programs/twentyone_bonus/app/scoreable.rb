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

  def update_tally(player_score, player_tally, dealer_score, dealer_tally)
    case
    when busted?(player_score)
      dealer_tally[:dealer] += 1
      "Player busts!!  Dealer wins!!"
    when busted?(dealer_score)
      player_tally[:player] += 1
      "Dealer busts!!  Player wins!!"
    when player_score > dealer_score
      player_tally[:player] += 1
      "Player score: #{player_score}, Dealer score: #{dealer_score}." +
      "  Player wins!!"
    end
  end
end
