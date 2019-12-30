require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Tree
  include Enumerable
  def each; end
  def <=>; end
end

class Exercise1Test < Minitest::Test
  attr_accessor :tree

  def setup
    @tree = Tree.new
  end

  def test_enumerable_included
    expected = [Tree, Enumerable, Object, Kernel, BasicObject]
    result = Tree.ancestors
    assert(Tree.ancestors.include?(Enumerable))
  end

  def test_respond_to_each
    assert_respond_to(tree, :each)
  end

  def test_respond_to_spaceship
    assert_respond_to(tree, :<=>)
  end
end