require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../lib/rock'
require_relative '../lib/paper'
require_relative '../lib/scissors'
require_relative '../lib/lizard'
require_relative '../lib/spock'
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

end
