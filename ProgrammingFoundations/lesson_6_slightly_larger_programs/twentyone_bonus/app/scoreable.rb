module Scoreable
  LARGEST_ALLOWABLE_SCORE = 21
  ROUNDS_TO_WIN_GAME = 5

  def busted?(score)
    score > LARGEST_ALLOWABLE_SCORE
  end

  def game_over?(game_tally)
    game_tally.value?(ROUNDS_TO_WIN_GAME)
  end

  def initialize_game_tally
    { player: 0, dealer: 0 }
  end

  def return_round_result(player_score, dealer_score)
    if busted?(player_score)
      :player_busts
    elsif busted?(dealer_score)
      :dealer_busts
    elsif player_score > dealer_score
      :player
    elsif dealer_score > player_score
      :dealer
    else :tie
    end
  end

  def return_game_winner(game_tally)
    if game_tally[:player] == ROUNDS_TO_WIN_GAME
      :player_wins
    elsif game_tally[:dealer] == ROUNDS_TO_WIN_GAME
      :dealer_wins
    else :no_winner
    end
  end

  def total(cards)
    sum = cards.values.sum
    aces = cards.select { |card, _| card[0] == "A" }
    return sum if aces.empty?
    aces.each do |ace, value|
      if sum > LARGEST_ALLOWABLE_SCORE
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
