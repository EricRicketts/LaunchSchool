require_relative './card'

class Deck
  SUITS = %w[Clubs Diamonds Hearts Spades]
  RANKS = (2..10).map(&:to_s).push("Jack", "Queen", "King", "Ace")

  attr_accessor :cards

  def initialize
    @cards = create_cards
  end

  def deal(num_cards)
    cards.pop(num_cards)
  end

  def number_of_cards
    cards.size
  end

  def shuffle
    5.times { cards.shuffle! }
  end

  private

  def create_cards
    SUITS.each_with_object([]) do |suit, arr|
      RANKS.each do |rank|
        arr.push(Card.new(suit, rank))
      end
    end
  end
end
