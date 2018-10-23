require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseEightTest < Minitest::Test
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

  def test_one
    cards = [Card.new(2, 'Hearts'),
             Card.new(10, 'Diamonds'),
             Card.new('Ace', 'Clubs')]
    assert_output(/2 of Hearts\n10 of Diamonds\nAce of Clubs\n/) { puts cards }
    assert_equal(Card.new(2, 'Hearts'), cards.min)
    assert_equal(Card.new('Ace', 'Clubs'), cards.max)
  end

  def test_two
    cards = [Card.new(5, 'Hearts')]
    assert_equal(Card.new(5, 'Hearts'), cards.min)
    assert_equal(Card.new(5, 'Hearts'), cards.max)
  end

  def test_three
    cards = [Card.new(4, 'Hearts'),
             Card.new(4, 'Diamonds'),
             Card.new(10, 'Clubs')]
    assert_equal(4, cards.min.rank)
    assert_equal(Card.new(10, 'Clubs'), cards.max)
  end

  def test_four
    cards = [Card.new(7, 'Diamonds'),
             Card.new('Jack', 'Diamonds'),
             Card.new('Jack', 'Spades')]
    assert_equal(Card.new(7, 'Diamonds'), cards.min)
    assert_equal('Jack', cards.max.rank)
  end

  def test_five
    cards = [Card.new(8, 'Diamonds'),
             Card.new(8, 'Clubs'),
             Card.new(8, 'Spades')]
    assert_equal(8, cards.min.rank)
    assert_equal(8, cards.max.rank)
  end
end