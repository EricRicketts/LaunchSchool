require 'pry-byebug'
class Board
  def initialize
    @squares = (1..9).each_with_object({}) do |key, hash|
      hash[key] = Square.new
    end
  end

  def get_square_at(key)
    @squares[key]
  end

  def set_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select do |key|
      @squares[key].unmarked?
    end.sort
  end

  def full?
    unmarked_keys.empty?
  end
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!  Goodbye!"
  end

  def display_board
    a =  board.instance_variable_get("@squares").values
    system 'clear'
    puts "You are a #{human.marker}.  Computer is a #{computer.marker}."
    puts ""
    puts "     |     |  "
    puts "  #{a[0]}  |  #{a[1]}  |  #{a[2]}"
    puts "     |     |  "
    puts "-----+-----+-----"
    puts "     |     |  "
    puts "  #{a[3]}  |  #{a[4]}  |  #{a[5]}"
    puts "     |     |  "
    puts "-----+-----+-----"
    puts "     |     |  "
    puts "  #{a[6]}  |  #{a[7]}  |  #{a[8]}"
    puts "     |     |  "
    puts ""
  end

  def display_result
    display_board
  end

  def human_moves
    square = nil
    loop do
      puts "Choose a square (#{board.unmarked_keys.join(", ")}): "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice."
    end
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def play
    display_welcome_message
    display_board
    loop do
      human_moves
      break if board.full?
      # break if someone_won? || board_full?

      computer_moves
      break if board.full?
      display_board
      # break if someone_won? || board_full?
    end
    display_result
    display_goodbye_message
  end
end

game = TTTGame.new
game.play