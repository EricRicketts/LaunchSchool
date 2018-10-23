require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseNineTest < Minitest::Test
  attr_accessor :deck, :drawn

  module CardValues
    include Comparable
    VALUES = (2..10).to_a.push('Jack', 'Queen', 'King', 'Ace').zip((2..14).to_a).to_h

    def <=>(other)
      VALUES[rank] <=> VALUES[other.rank]
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
      @cards = create_all_cards
    end

    def draw
      self.cards = create_all_cards if cards.empty?
      cards.pop
    end

    private

    def create_all_cards
      SUITS.map do |suit|
        RANKS.map do |rank|
          Card.new(rank, suit)
        end
      end.flatten.shuffle
    end
  end

  def setup
    @deck = Deck.new
    @drawn = []
  end

  def test_one
    52.times { drawn << deck.draw }
    number_of_fives = drawn.count { |card| card.rank == 5 }
    assert_equal(4, number_of_fives)
  end

  def test_two
    52.times { drawn << deck.draw }
    number_of_hearts = drawn.count { |card| card.suit == 'Hearts' }
    assert_equal(13, number_of_hearts)
  end

  def test_three
    52.times { drawn << deck.draw }
    drawn2 = []
    52.times { drawn2 << deck.draw }
    refute(drawn == drawn2)
  end
end