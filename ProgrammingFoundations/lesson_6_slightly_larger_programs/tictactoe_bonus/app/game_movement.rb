require_relative './game_view'

module GameMovement
  include GameView

  ALLOWABLE_SQUARE_SELECTIONS = ("1".."9").to_a.freeze

  def collect_unoccupied_squares(board)
    flattened_board = board.flatten
    unocccpied_squares = flattened_board.each_index.select do |index|
      flattened_board[index].eql?(GameView::SPACE)
    end
    unocccpied_squares.map { |empty_index| empty_index + 1 }
  end

  def decrement(num)
    num - 1
  end

  def mark_board_at_square(board, square, symbol)
    row, col = decrement(square).divmod(3)
    board[row][col] = symbol
  end

  def valid_square_selection?(square, valid_squares)
    ALLOWABLE_SQUARE_SELECTIONS.include?(square) &&
      valid_squares.include?(square.to_i)
  end
end
