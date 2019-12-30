require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseTenTest < Minitest::Test
  module CardValues
    include Comparable
    VALUES = (2..10).to_a.push('Jack', 'Queen', 'King', 'Ace').zip((2..14).to_a).to_h

    def <=>(other)
      self.value <=> other.value
    end

    def value
      VALUES[rank]
    end
  end

  class Card
    include CardValues
    attr_reader :rank, :suit

    def initialize(rank, suit)
      @rank = rank
      @suit = suit
    end

    def to_s
      "#{rank} of #{suit}"
    end
  end

  class Deck
    RANKS = (2..10).to_a + %w(Jack Queen King Ace).freeze
    SUITS = %w(Hearts Clubs Diamonds Spades).freeze
    attr_accessor :cards

    def initialize
      reset
    end

    def draw
      reset if cards.empty?
      cards.pop
    end

    private

    def reset
      @cards = RANKS.product(SUITS).map do |rank, suit|
        Card.new(rank, suit)
      end.shuffle
    end
  end


  class PokerHand
    attr_accessor :cards

    def initialize(cards)
      @cards = cards
    end

    def print
      cards.each { |card| puts card }
    end

    def evaluate
      case
      when royal_flush? then 'Royal flush'
      when straight_flush? then 'Straight flush'
      when four_of_a_kind? then 'Four of a kind'
      when full_house? then 'Full house'
      when flush? then 'Flush'
      when straight? then 'Straight'
      when three_of_a_kind? then 'Three of a kind'
      when two_pair? then 'Two pair'
      when pair? then 'Pair'
      else 'High card'
      end
    end

    private

    def count_most_numerous_rank
      values = cards.map(&:value)
      values.map { |value| values.count(value) }.max
    end

    def flush?
      suit = cards.first.suit
      cards.all? { |card| card.suit == suit }
    end

    def four_of_a_kind?
      count_most_numerous_rank == 4
    end

    def full_house?
      first_card_rank = cards.first.rank
      two_sets_of_cards = cards.partition { |card| first_card_rank == card.rank }
      same_rank?(two_sets_of_cards.first) && same_rank?(two_sets_of_cards.last)
    end

    def pair?
      count_most_numerous_rank == 2
    end

    def royal_flush?
      min_card_value = cards.min.value
      lowest_value_royal_flush = 10
      min_card_value == lowest_value_royal_flush && straight? && flush?
    end

    def same_rank?(cards)
      first_card_rank = cards.first.rank
      cards.all? { |card| first_card_rank == card.rank }
    end

    def straight?
      sorted_values = cards.sort_by { |card| card }.map(&:value)
      (cards.min.value..cards.max.value).to_a == sorted_values
    end

    def straight_flush?
      straight? && flush?
    end

    def three_of_a_kind?
      count_most_numerous_rank == 3
    end

    def two_pair?
      unique_values_for_two_pair = 3
      cards.map(&:value).uniq.size == unique_values_for_two_pair
    end
  end

  def test_royal_flush
    hand = PokerHand.new([
      Card.new(10,      'Hearts'),
      Card.new('Ace',   'Hearts'),
      Card.new('Queen', 'Hearts'),
      Card.new('King',  'Hearts'),
      Card.new('Jack',  'Hearts')
    ])
    assert_equal('Royal flush', hand.evaluate)
  end

  def test_straight_flush
    hand = PokerHand.new([
      Card.new(8,       'Clubs'),
      Card.new(9,       'Clubs'),
      Card.new('Queen', 'Clubs'),
      Card.new(10,      'Clubs'),
      Card.new('Jack',  'Clubs')
    ])
    assert_equal('Straight flush', hand.evaluate)
  end

  def test_four_of_a_kind
    hand = PokerHand.new([
      Card.new(3, 'Hearts'),
      Card.new(3, 'Clubs'),
      Card.new(5, 'Diamonds'),
      Card.new(3, 'Spades'),
      Card.new(3, 'Diamonds')
    ])
    assert_equal('Four of a kind', hand.evaluate)
  end

  def test_full_house
    hand = PokerHand.new([
      Card.new(3, 'Hearts'),
      Card.new(3, 'Clubs'),
      Card.new(5, 'Diamonds'),
      Card.new(3, 'Spades'),
      Card.new(5, 'Hearts')
    ])
    assert_equal('Full house', hand.evaluate)
  end

  def test_flush
    hand = PokerHand.new([
      Card.new(10, 'Hearts'),
      Card.new('Ace', 'Hearts'),
      Card.new(2, 'Hearts'),
      Card.new('King', 'Hearts'),
      Card.new(3, 'Hearts')
    ])
    assert_equal('Flush', hand.evaluate)
  end

  def test_straight
    hand = PokerHand.new([
      Card.new(8,      'Clubs'),
      Card.new(9,      'Diamonds'),
      Card.new(10,     'Clubs'),
      Card.new(7,      'Hearts'),
      Card.new('Jack', 'Clubs')
    ])
    assert_equal('Straight', hand.evaluate)
  end

  def test_three_of_a_kind
    hand = PokerHand.new([
      Card.new(3, 'Hearts'),
      Card.new(3, 'Clubs'),
      Card.new(5, 'Diamonds'),
      Card.new(3, 'Spades'),
      Card.new(6, 'Diamonds')
    ])
    assert_equal('Three of a kind', hand.evaluate)
  end

  def test_two_pair
    hand = PokerHand.new([
      Card.new(9, 'Hearts'),
      Card.new(9, 'Clubs'),
      Card.new(5, 'Diamonds'),
      Card.new(8, 'Spades'),
      Card.new(5, 'Hearts')
    ])
    assert_equal('Two pair', hand.evaluate)
  end

  def test_pair
    hand = PokerHand.new([
      Card.new(2, 'Hearts'),
      Card.new(9, 'Clubs'),
      Card.new(5, 'Diamonds'),
      Card.new(9, 'Spades'),
      Card.new(3, 'Diamonds')
    ])
    assert_equal('Pair', hand.evaluate)
  end

  def test_high_card
    hand = PokerHand.new([
      Card.new(2,      'Hearts'),
      Card.new('King', 'Clubs'),
      Card.new(5,      'Diamonds'),
      Card.new(9,      'Spades'),
      Card.new(3,      'Diamonds')
    ])
    assert_equal('High card', hand.evaluate)
  end
end