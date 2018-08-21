class Player
  MOVES = ['rock', 'paper', 'scissors']
  attr_accessor :move

  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose rock, paper, or scissors:"
        choice = gets.chomp
        break if MOVES.include?(choice)
        puts 'Sorry, invalid choice, try again.'
      end
      self.move = choice
    else
      self.move = MOVES.sample
    end  
  end

  private

  def human?
    @player_type == :human
  end
end