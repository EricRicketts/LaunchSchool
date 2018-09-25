require_relative './player'
require_relative './deck'

class Dealer < Player
  attr_accessor :deck

  def initialize(name)
    super(name)
    @deck = Deck.new
  end
end