class Player
  MOVES = ['rock', 'paper', 'scissors']

  attr_accessor :move, :name

  def initialize
    set_name
  end
end