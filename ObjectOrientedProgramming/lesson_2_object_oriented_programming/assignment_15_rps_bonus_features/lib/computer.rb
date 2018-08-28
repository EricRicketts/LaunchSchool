require_relative './player'

class Computer < Player
  NAMES = ['R2-D2', 'C-3PO', 'Data',
    'Optimus Prime', 'HAL 9000', 'Wall-E']

  def initialize
    super
    self.name = NAMES.sample
  end

  def choose
    random = Rules::MOVES.sample
    self.move = Move.new(random.new)
  end
end
