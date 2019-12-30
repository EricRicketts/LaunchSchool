class Player
  attr_reader :name
  attr_accessor :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def reset
    self.cards = []
  end

  def take(new_cards)
    cards.push(*new_cards)
  end
end
