require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise5Test < Minitest::Test
  attr_reader :cards, :deck
  attr_accessor :player_cards

  def setup
    @player_cards = []
    @cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]
    @deck = {
      :hearts => cards, :diamonds => cards,
      :clubs => cards, :spades => cards
    }
  end

  def score(card)
    case card
    when :ace   then 11
    when :king  then 10
    when :queen then 10
    when :jack  then 10
    else card
    end
  end

  def sum_cards(deck)
    sum = deck.reduce(0) do |sum, (_, remaining_cards)|
      remaining_cards.map do |card|
        score(card)
      end
      sum += remaining_cards.sum
      # the problem here is that remaining_cards is never changed
      # as Enumerable#map does not mutate the array but returns a
      # new array, but no local variable recieves the results of this
      # transformation.  Thus we call Array#sum over an array that
      # contains a mix of numbers and symbols and we will get a TypeError
      # when we add a number to a symbol
    end
  end

  def sum_cards_fix(deck)
    deck.reduce(0) do |sum, (_, remaining_cards)|
      sum += remaining_cards.map do |card|
        score(card)
      end.sum
    end
  end


  def test_wrong_answer
    deck.keys.each do |suit|
      cards = deck[suit]
      cards.shuffle!
      player_cards << cards.pop
      # we are removing four cards from the cards array
      # because the Array#pop method mutates the array
      # now each suite in the deck is going to miss four
      # cards, the way to fix this is to return cards.last
      # which returns the last element but does not change
      # the array
    end

    assert_raises(TypeError) { sum_cards(deck) }
  end

  def test_fix
    deck.keys.each do |suit|
      cards = deck[suit]
      cards.shuffle!
      player_cards << cards.last
    end

    assert_equal(4*95, sum_cards_fix(deck))
  end
end
