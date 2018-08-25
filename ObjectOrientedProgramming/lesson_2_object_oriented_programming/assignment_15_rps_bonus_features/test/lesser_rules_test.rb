require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../lib/rock'
require_relative '../lib/paper'
require_relative '../lib/scissors'
require_relative '../lib/lizard'
require_relative '../lib/spock'
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
    result1 = Rules::LESSER_THAN_RULES[rock.class].call(paper.class)
    result2 = Rules::LESSER_THAN_RULES[rock.class].call(spock.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_paper_rules
    # skip
    result1 = Rules::LESSER_THAN_RULES[paper.class].call(lizard.class)
    result2 = Rules::LESSER_THAN_RULES[paper.class].call(scissors.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_scissors_rules
    # skip
    result1 = Rules::LESSER_THAN_RULES[scissors.class].call(spock.class)
    result2 = Rules::LESSER_THAN_RULES[scissors.class].call(rock.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_lizard_rules
    # skip
    result1 = Rules::LESSER_THAN_RULES[lizard.class].call(rock.class)
    result2 = Rules::LESSER_THAN_RULES[lizard.class].call(scissors.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

  def test_lesser_spock_rules
    # skip
    result1 = Rules::LESSER_THAN_RULES[spock.class].call(paper.class)
    result2 = Rules::LESSER_THAN_RULES[spock.class].call(lizard.class)
    result = [result1, result2]
    assert_equal(expected, result)
  end

end