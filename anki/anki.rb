# require 'minitest/autorun'
# require 'minitest/pride'
require 'pry-byebug'

require 'minitest/autorun'

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class AnkiTest < Minitest::Test
  attr_accessor :kitty
  def setup
    @kitty = Cat.new('Kitty')
  end

  def test_foo
    assert(kitty.name == 'Milo')
  end
end
