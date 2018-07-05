module Dealable
  def create_cards
    faces = ('2'..'10').to_a + ["J", "Q", "K", "A"]
    suits = ["C", "D", "H", "S"]
    suits.product(faces).map { |suit, face| face + suit }
  end

  def create_deck
    deck_hash = {}
    cards = create_cards
    values = (2..10).to_a + [10, 10, 10, 11]
    num_values = values.size
    cards.each.with_index do |card, idx|
      deck_hash[card] = values[idx % num_values]
    end
    deck_hash
  end

  def deal_card(deck)
    card, value = deck.first
    deck.delete(card)
    { card => value }
  end

  def initialize_deck
    unshuffled_deck = create_deck
    shuffle_deck(unshuffled_deck)
  end

  def shuffle_deck(deck)
    deck.to_a.shuffle.to_h
  end
end
