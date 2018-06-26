module Dealable
  def create_cards
    faces = ('2'..'10').to_a + ["J", "Q", "K", "A"]
    suites = ["C", "D", "H", "S"]
    suites.map do |suite|
      faces.map do |face|
        face + suite
      end
    end
  end

  def create_deck
    cards = create_cards
    values = (2..10).to_a + [10, 10, 10, 1]
    cards_and_values = cards.zip(Array.new(4, values))
    deck_array = cards_and_values.map do |card_ary, value_ary|
      card_ary.zip(value_ary).to_h
    end

    deck_array.inject({}) { |hsh, suite| hsh.merge(suite) }
  end
end
