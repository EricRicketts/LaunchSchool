require_relative './move'

class Player
  attr_accessor :name, :move, :tally

  def initialize
    @tally = 0
    set_name
  end
end
