class GuessingGamePartTwo
  def initialize(low, high)
    @low = low
    @high = high
    @guesses = Math.log2(high - low).to_i + 1
    @magic_number = Random.new.rand(low..high)
  end

  def play
    loser_statement = "You are out of guesses.  You lose."
    loop do
      sanitize_input
      break puts "You win!\n\n" if win?
      evaluate_input
      break puts loser_statement if no_more_guesses?
    end
  end

  protected

  attr_accessor :guesses, :guess

  private

  attr_reader :magic_number, :low, :high

  def evaluate_input
    if guess < magic_number
      puts "Your guess is too low.\n\n"
    elsif guess > magic_number
      puts "Your guess is too high.\n\n"
    end
    self.guesses -= 1
  end

  def no_more_guesses?
    guesses.zero?
  end

  def prompt
    puts "You have #{guesses} guesses remaining."
    puts "Enter a number between #{low} and #{high}: "
    gets.strip.chomp.to_i
  end

  def sanitize_input
    loop do
      self.guess = prompt
      break if (low..high).include?(guess)
      puts "Sorry, incorrect input."
    end
  end

  def win?
    magic_number == guess
  end
end