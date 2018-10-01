require 'pry-byebug'
module Rules
  PERFECT_SCORE = 21
  ACE_ADJUSTMENT = 10
  ROYAL_VALUE = 10
  ACE_VALUE = 11
  DEALER_CUTOFF = 17
  WINNING_TALLY = 10

  attr_accessor :game_tally

  def busted?(cards)
    score(cards) > PERFECT_SCORE
  end

  def dealer_stays?(cards)
    score(cards) >= DEALER_CUTOFF
  end

  def game_winner?
    game_tally.values.any? { |tally| tally >= WINNING_TALLY }
  end

  def determine_game_winner
    game_tally.key(WINNING_TALLY)
  end

  def give_values_to(cards)
    cards.each do |card|
      case card.rank
      when ('2'..'10')
        card.value = card.rank.to_i
      when "Jack", "Queen", "King"
        card.value = ROYAL_VALUE
      else
        card.value = ACE_VALUE
      end
    end
  end

  def score(cards)
    aces = cards.select { |card| card.rank == "Ace" }
    sum = cards.map(&:value).sum
    return sum if aces.empty?
    aces_count = aces.length
    until aces_count.zero? || sum <= PERFECT_SCORE
      if sum > PERFECT_SCORE
        sum -= ACE_ADJUSTMENT
        aces_count -= 1
      end
    end
    sum
  end

  private

  def handle_ace(sum, ace)
    sum + ace.value > PERFECT_SCORE ? ACE_ADJUSTMENT : ace.value
  end
end
