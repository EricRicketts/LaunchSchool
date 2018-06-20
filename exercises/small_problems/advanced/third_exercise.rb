require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ThirdExercise < Minitest::Test

  def transpose(matrix)
    matrix.map.with_index do |row, row_idx|
      row.map.with_index do |n, col_idx|
        matrix[col_idx][row_idx]
      end
    end
  end

  def test_1
    matrix = [[1, 5, 8], [4, 7, 2], [3, 9, 6]]
    expected = [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
    assert_equal(expected, transpose(matrix))
    assert_equal([[1, 5, 8], [4, 7, 2], [3, 9, 6]], matrix)
  end
  
end