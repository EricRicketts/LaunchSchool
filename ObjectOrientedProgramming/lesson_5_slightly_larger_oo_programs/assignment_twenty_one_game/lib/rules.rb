require 'pry-byebug'
module Rules
  PERFECT_SCORE = 21

  def initialize_values(cards)
    cards.each do |card|
      case card.rank
      when ('2'..'10')
        card.value = card.rank.to_i
      when "Jack", "Queen", "King"
        card.value = 10
      else
        card.value = 11
      end
    end
  end

  def score(cards)
    cards.sort_by do |card|
      card.value
    end.inject(0) do |sum, card|
      sum += (card.rank == "Ace" ? handle_ace(sum, card) : card.value)
    end
  end

  private

  def handle_ace(sum, card)
    sum + card.value > PERFECT_SCORE ? sum - 10 : sum + card.value
  end
end