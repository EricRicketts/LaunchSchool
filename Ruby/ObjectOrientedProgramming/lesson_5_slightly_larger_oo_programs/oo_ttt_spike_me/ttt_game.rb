class Board
  WINING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # columns
    [1, 5, 9], [3, 5, 7] # diagonals
  ]
  def initialize
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
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

  def someone_won?
    !!winning_marker
  end

  def three_identical_markers(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def winning_marker
    WINING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def reset
    @squares = (1..9).each_with_object({}) do |key, hash|
      hash[key] = Square.new
    end
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    a =  instance_variable_get("@squares").values
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
  end
  # rubocop:enable Metrics/AbcSize
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

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_reader :marker, :name
end

class ComputerPlayer < Player
  NAMES = %w[R2D2 C3P0 WALL-E HAL-9000 DATA BFORE]
  def initialize(maker)
    @marker = maker
    @name = NAMES.sample
  end
end

class HumanPlayer < Player
  def choose_name
    entered_name = ''
    loop do
      puts "Please enter your name, it must be at least 2 non-space characters long."
      entered_name = gets.strip.chomp
      break unless entered_name.length < 2
      puts "Sorry, the name is not long enough."
    end
    @name = entered_name
  end

  def choose_marker
    entered_marker = ''
    loop do
      puts "Please enter your marker, it must be one non-space character."
      entered_marker = gets.strip.chomp
      break unless entered_marker.length > 1
      puts "Sorry the marker is too big."
    end
    @marker = entered_marker
  end
end

class TTTGame
  HUMAN_MARKER = "X"
  COMPUTER_MARKER = "O"
  FIRST_TO_MOVE = HUMAN_MARKER

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = HumanPlayer.allocate
    @computer = ComputerPlayer.new(COMPUTER_MARKER)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    clear
    display_welcome_message
    get_human_name_and_marker
    loop do
      display_board
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end

  private

  def clear
    system 'clear'
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def get_human_name_and_marker
    human.choose_name
    puts
    human.choose_marker
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe!  Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_board
    puts "#{human.name} is a #{human.marker}.  #{computer.name} is a #{computer.marker}."
    puts
    board.draw
    puts
  end

  def display_result
    display_board

    case board.winning_marker
    when human.marker then puts "#{human.name} wins!!"
    when computer.marker then puts "#{computer.name} won!!"
    else puts "It is a tie!!"
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARKER
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = HUMAN_MARKER
    end
  end

  def human_moves
    square = nil
    loop do
      puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that is not a valid choice."
    end
    board[square] = human.marker
  end

  def computer_moves
    square = board.unmarked_keys.sample
    board[square] = computer.marker
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.downcase.chomp
      break if %w[y n].include?(answer)
      puts "Sorry, must be y or n."
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = FIRST_TO_MOVE
    clear
  end

  def display_play_again_message
    puts "Let us play again!!"
    puts
  end
end

game = TTTGame.new
game.play
