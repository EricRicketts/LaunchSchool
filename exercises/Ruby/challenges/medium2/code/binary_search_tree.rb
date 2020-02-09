require 'pry-byebug'

class Bst
  include Enumerable
  attr_accessor :data, :left, :right, :parent

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @parent = nil
  end

  def each
    node = self
    if node.parent
      yield node.data
      node = node.parent
    else
      yield node.data
    end
  end

  def insert(value)
    if self.left.nil? && value <= self.data
      self.left = Bst.new(value)
      self.left.parent = self
    elsif self.right.nil? && value > self.data
      self.right = Bst.new(value)
      self.right.parent = self
    elsif !self.left.nil? && value <= self.data
      self.left.insert(value)
    else
      self.right.insert(value)
    end
  end
end
