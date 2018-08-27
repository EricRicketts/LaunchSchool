require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

require_relative '../lib'
require_relative '../lib/rules'

class EqualRulesTest < Minitest::Test
  attr_accessor :rock, :paper, :scissors, :lizard, :spock

  def setup
    @rock, @paper, @scissors = Rock.new, Paper.new, Scissors.new
    @lizard, @spock = Lizard.new, Spock.new
  end

  def test_rock_equal
    assert(Rules::EQUAL_TO[@rock.class].call(@rock.class))
  end

  def test_paper_equal
    assert(Rules::EQUAL_TO[@paper.class].call(@paper.class))
  end

  def test_scissors_equal
    assert(Rules::EQUAL_TO[@scissors.class].call(@scissors.class))
  end

  def test_lizard_equal
    assert(Rules::EQUAL_TO[@lizard.class].call(@lizard.class))
  end

  def test_spock_equal
    assert(Rules::EQUAL_TO[@spock.class].call(@spock.class))
  end

end
