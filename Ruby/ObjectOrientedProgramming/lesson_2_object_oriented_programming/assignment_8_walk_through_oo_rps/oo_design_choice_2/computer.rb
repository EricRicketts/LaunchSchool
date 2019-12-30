require_relative './player'
require_relative './move'

class Computer < Player
  NAMES = ['R2D2', 'C3PO', 'HAL', 'CHAPPIE', 'SONNY', 'NUMBER 5']

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end

  def set_name
    self.name = NAMES.sample
  end
end
