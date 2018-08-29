require_relative './human'
require_relative './computer'

class RpsGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end
end

RpsGame.new