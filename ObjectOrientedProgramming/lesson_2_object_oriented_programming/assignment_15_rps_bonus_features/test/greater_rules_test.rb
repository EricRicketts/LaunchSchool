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

  def test_greater_rock_rules
    # skip
    result1 = Rules::GREATER_THAN[rock.class].call(lizard.class)
    result2 = Rules::GREATER_THAN[rock.class].call(scissors.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_greater_paper_rules
    # skip
    result1 = Rules::GREATER_THAN[paper.class].call(rock.class)
    result2 = Rules::GREATER_THAN[paper.class].call(spock.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_greater_scissors_rules
    # skip
    result1 = Rules::GREATER_THAN[scissors.class].call(paper.class)
    result2 = Rules::GREATER_THAN[scissors.class].call(lizard.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_greater_lizard_rules
    # skip
    result1 = Rules::GREATER_THAN[lizard.class].call(spock.class)
    result2 = Rules::GREATER_THAN[lizard.class].call(paper.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_greater_spock_rules
    # skip
    result1 = Rules::GREATER_THAN[spock.class].call(rock.class)
    result2 = Rules::GREATER_THAN[spock.class].call(scissors.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

end
