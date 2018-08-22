require_relative './player'
require_relative './move'

class Human < Player
  def choose
    choice = ''
    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice, try again."
    end
    self.move = Move.new(choice)
  end

  def set_name
    n = ''
    loop do
      puts "What is your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, you must enter a value, try again."
    end
    self.name = n
  end
end
