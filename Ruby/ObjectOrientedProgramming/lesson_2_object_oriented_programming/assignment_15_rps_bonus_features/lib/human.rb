require_relative './player'

class Human < Player
  def choose
    choices = %w[rock paper scissors lizard spock]
    response = ''
    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      response = gets.strip.downcase.chomp
      break if choices.include?(response)
      puts "Sorry, invalid choice, try again."
    end
    class_name = response.capitalize
    chosen_move = Module.const_get(class_name).new
    self.move = Move.new(chosen_move)
  end

  def set_name
    response = ''
    loop do
      puts 'Please enter your name: '
      response = gets.strip.chomp
      break unless response.empty?
      puts 'Sorry, you must enter a value for your name.'
    end
    self.name = response
  end
end
