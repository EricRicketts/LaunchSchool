require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/rules'

class Greater_RulesTest < Minitest::Test
  attr_accessor :rock, :paper, :scissors, :lizard, :spock, :expected

  def setup
    @rock, @paper, @scissors = Rock.new, Paper.new, Scissors.new
    @lizard, @spock = Lizard.new, Spock.new
    @expected = [true, true]
  end

  def test_lesser_rock_rules
    # skip
    result1 = Rules::LESS_THAN[rock.class].call(paper.class)
    result2 = Rules::LESS_THAN[rock.class].call(spock.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_paper_rules
    # skip
    result1 = Rules::LESS_THAN[paper.class].call(lizard.class)
    result2 = Rules::LESS_THAN[paper.class].call(scissors.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_scissors_rules
    # skip
    result1 = Rules::LESS_THAN[scissors.class].call(spock.class)
    result2 = Rules::LESS_THAN[scissors.class].call(rock.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_lizard_rules
    # skip
    result1 = Rules::LESS_THAN[lizard.class].call(rock.class)
    result2 = Rules::LESS_THAN[lizard.class].call(scissors.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_spock_rules
    # skip
    result1 = Rules::LESS_THAN[spock.class].call(paper.class)
    result2 = Rules::LESS_THAN[spock.class].call(lizard.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

end
