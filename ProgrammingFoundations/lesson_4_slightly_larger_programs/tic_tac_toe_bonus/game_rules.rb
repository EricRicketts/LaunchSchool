require_relative './game_view'

module GameRules
include GameView

def decrement(num)
  num - 1
end

def detect_anti_diagonal_winner(board, selected_square, player)
  row_size = board.first.size
  anti_diagonal_square_numbers = generate_anti_diagonal_square_numbers(board)
  return nil unless anti_diagonal_square_numbers.include?(selected_square)

  winner = generate_and_check_either_diagonal(anti_diagonal_square_numbers,
                                              board, row_size, player)
  winner ? player : nil
end

def detect_column_winner(board, selected_square, player)
  column = decrement(selected_square) % 3
  column_values = board[0..2].map { |row| row[column] }
  winner = column_values.all? { |square| square.eql?(player) }
  winner ? player : nil
end

def detect_diagonal_winner(board, selected_square, player)
  row_size = board.first.size
  diagonal_square_numbers = generate_diagonal_square_numbers(board)
  return nil unless diagonal_square_numbers.include?(selected_square)

  winner = generate_and_check_either_diagonal(diagonal_square_numbers,
                                              board, row_size, player)
  winner ? player : nil
end

def detect_row_winner(board, selected_square, player)
  row_size = board.first.size
  row = decrement(selected_square).div(row_size)
  winner = board[row].all? { |square| square.eql?(player) }
  winner ? player : nil
end

def generate_and_check_either_diagonal(square_numbers, board, row_size, player)
  decremented_square_numbers =
    square_numbers.map { |square_number| decrement(square_number) }
  either_diagonal_squares =
    decremented_square_numbers.map { |square| square.divmod(row_size) }
  either_diagonal_squares.all? do |square|
    board[square.first][square.last].eql?(player)
  end
end

def generate_anti_diagonal_square_numbers(board)
  row_size = board.first.size
  (2..row_size).to_a.inject([row_size]) do |anti_diagonal_numbers|
    anti_diagonal_numbers << anti_diagonal_numbers.last + row_size - 1
  end
end

def generate_diagonal_square_numbers(board)
  row_size = board.first.size
  (2..row_size).to_a.inject([1]) do |diagonal_numbers|
    diagonal_numbers << diagonal_numbers.last + row_size + 1
  end
end

def tie?(board)
  flattened_board = board.flatten
  flattened_board.none? { |square| square.eql?(GameView::SPACE) }
end

def win_or_tie?(board, selected_square, player)
  !!detect_row_winner(board, selected_square, player) ||
    !!detect_column_winner(board, selected_square, player) ||
    !!detect_diagonal_winner(board, selected_square, player) ||
    !!detect_anti_diagonal_winner(board, selected_square, player) ||
    tie?(board)
end

end # module GameRules