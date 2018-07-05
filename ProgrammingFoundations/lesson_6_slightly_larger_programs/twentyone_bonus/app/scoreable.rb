module Scoreable

  def busted?(score)
    score > 21
  end

  def game_over?(game_tally)
    game_tally.values.include?(5)
  end

  def initialize_game_tally
    { player: 0, dealer: 0 }
  end

  def return_round_result(player_score, dealer_score)
    case
    when busted?(player_score) then :player_busts
    when busted?(dealer_score) then :dealer_busts
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

  def update_tally(round_result, game_tally)
    case round_result
    when :dealer_busts, :player then game_tally[:player] += 1
    when :player_busts, :dealer then game_tally[:dealer] += 1
    else game_tally
    end
  end
end
