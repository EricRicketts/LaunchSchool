require 'pry-byebug'
module Rules
  PERFECT_SCORE = 21
  ACE_ADJUSTMENT = 1
  ROYAL_VALUE = 10
  ACE_VALUE = 11
  DEALER_CUTOFF = 17

  def busted?(cards)
    score(cards) > PERFECT_SCORE
  end

  def dealer_stays?(cards)
    score(cards) >= DEALER_CUTOFF
  end

  def set_values(cards)
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
    cards.sort_by(&:value).inject(0) do |sum, card|
      sum + (card.rank == "Ace" ? handle_ace(sum, card) : card.value)
    end
  end

  private

  def handle_ace(sum, ace)
    sum + ace.value > PERFECT_SCORE ? ACE_ADJUSTMENT : ace.value
  end
end
