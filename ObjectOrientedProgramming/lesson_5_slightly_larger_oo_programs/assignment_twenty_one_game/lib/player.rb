class Player
  attr_reader :name
  attr_accessor :cards, :status

  def initialize(name)
    @name = name
    @cards = []
    @status = :hit
  end

  def reset
    self.cards = []
    self.status = :hit
  end

  def take(new_cards)
    cards.push(*new_cards)
  end
end
