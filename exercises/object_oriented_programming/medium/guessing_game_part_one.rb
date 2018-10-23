class GuessingGamePartOne
  GUESSES_ALLOWED = 7
  UPPER_LIMIT = 100
  LOWER_LIMIT = 1

  def initialize
    @guesses = GUESSES_ALLOWED
    @magic_number = Random.new.rand(LOWER_LIMIT..UPPER_LIMIT)
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

  attr_reader :magic_number

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
    puts "Enter a number between #{LOWER_LIMIT} and #{UPPER_LIMIT}: "
    gets.strip.chomp.to_i
  end

  def sanitize_input
    loop do
      self.guess = prompt
      break if (LOWER_LIMIT..UPPER_LIMIT).include?(guess)
      puts "Sorry, incorrect input."
    end
  end

  def win?
    magic_number == guess
  end
end