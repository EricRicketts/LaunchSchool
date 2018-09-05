require_relative './rules'

class Move
  include Comparable
  include Rules

  attr_reader :selection

  def initialize(selection)
    @selection = selection
  end

  def <=>(other)
    object_class = selection.class
    other_class = other.selection.class

    return -1 if Rules::LESS_THAN[object_class].call(other_class)
    return 0 if Rules::EQUAL_TO[object_class].call(other_class)
    return 1 if Rules::GREATER_THAN[object_class].call(other_class)
  end

  def to_s
    selection.class.to_s
  end
end
