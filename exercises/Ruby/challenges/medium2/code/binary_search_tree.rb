# frozen_string_literal: true

# Bst creates binary search tree data structure
class Bst
  attr_accessor :data, :left, :right
  def initialize(data)
    @data = data
  end

  def insert(value)
    value <= data ? insert_left(value) : insert_right(value)
  end

  def each(&block)
    return to_enum(:each) if block.nil?

    left&.each(&block)
    block.call(data)
    right&.each(&block)
  end

  private

  def insert_left(value)
    left.nil? ? self.left = Bst.new(value) : left.insert(value)
  end

  def insert_right(value)
    right.nil? ? self.right = Bst.new(value) : right.insert(value)
  end
end
