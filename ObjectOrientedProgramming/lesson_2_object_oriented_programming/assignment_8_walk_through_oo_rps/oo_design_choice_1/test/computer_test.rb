require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'
require_relative '../computer'

class TestPlayer < Minitest::Test
  attr_accessor :computer

  def setup
    @computer = Computer.new
  end

  def test_class
    assert(Computer == computer.class)
  end

  def test_superclass
    assert(Player == computer.class.superclass)
  end

  def test_name
    assert(Computer::NAMES.include?(computer.name))
  end

  def test_choose
    assert(Player::MOVES.include?(computer.choose))
  end
end