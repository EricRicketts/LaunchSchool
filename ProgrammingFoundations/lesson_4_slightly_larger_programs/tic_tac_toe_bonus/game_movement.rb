require_relative './view'

module GameMovement
  include View

  ALLOWABLE_SQUARE_SELECTIONS = ("1".."9").to_a.freeze

  def collect_unoccupied_squares(board)
    flattened_board = board.flatten
    flattened_board.each_index
                   .select { |index| flattened_board[index].eql?(View::SPACE) }
                   .map { |empty_index| empty_index + 1 }
  end

  def valid_square_selection?(square, valid_squares)
  ALLOWABLE_SQUARE_SELECTIONS.include?(square) &&
    valid_squares.include?(square.to_i)
  end

end # GameMovement