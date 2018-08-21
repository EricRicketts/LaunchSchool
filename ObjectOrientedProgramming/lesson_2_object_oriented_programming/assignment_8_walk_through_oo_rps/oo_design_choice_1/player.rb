class Player
  MOVES = ['rock', 'paper', 'scissors']
  attr_accessor :move, :name

  def initialize
    set_name
  end

  # def choose
  #   if human?
  #     choice = nil
  #     loop do
  #       puts "Please choose rock, paper, or scissors:"
  #       choice = gets.chomp
  #       break if MOVES.include?(choice)
  #       puts 'Sorry, invalid choice, try again.'
  #     end
  #     self.move = choice
  #   else
  #     self.move = MOVES.sample
  #   end  
  # end

  # private

  # def human?
  #   @player_type == :human
  # end

  # def set_name
  #   computer_names = ['R2D2', 'C3PO', 'HAL', 'CHAPPIE', 'SONNY', 'NUMBER 5']
  #   if human?
  #     n = ''
  #     loop do
  #       puts "What is your name?"
  #       n = gets.chomp
  #       break unless n.empty?
  #       puts "Sorry, you must enter a value."
  #     end
  #     self.name = n
  #   else
  #     self.name = computer_names.sample
  #   end
  # end
end