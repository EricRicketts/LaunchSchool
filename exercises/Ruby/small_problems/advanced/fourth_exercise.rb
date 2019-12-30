require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Transpose MxN

In the previous exercise, you wrote a method to transpose a 3 x 3 matrix as represented by a ruby Array of Arrays.

Matrix transposes aren't limited to 3 x 3 matrices, or even square matrices.
Any matrix can be transposed by simply switching columns with rows.

Modify your transpose method from the previous exercise so it works with any matrix with at least 1 row and 1 column.

Examples:

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]
=end
class FourthExerciseWithManual < Minitest::Test

  def transpose(matrix)
    number_rows = matrix.size
    number_cols = matrix.first.size
    transposed_matrix = Array.new(number_cols) { Array.new(number_rows) }
    matrix.each.with_index do |row, row_idx|
      row.each.with_index do |n, col_idx|
        transposed_matrix[col_idx][row_idx] = n
      end
    end
    transposed_matrix
  end

  def test_1
    # skip
    expected = [[1], [2], [3], [4]]
    result = transpose([[1, 2, 3, 4]])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [[1, 2, 3, 4]]
    result = transpose([[1], [2], [3], [4]])
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
    result = transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
    assert_equal(expected, result)
  end

  def test_4
    # skip
    expected = [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]
    result = transpose([[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]])
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = [[1]]
    result = transpose([[1]])
    assert_equal(expected, result)
  end

  def test_6
    # skip
    expected = [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
    result = transpose([[1, 5, 8], [4, 7, 2], [3, 9, 6]])
    assert_equal(expected, result)
  end
  
end


class FourthExerciseWithMap < Minitest::Test

  def transpose(matrix)
    rows, cols = matrix.size, matrix.first.size
    Array.new(cols) { Array.new(rows) }.map.with_index do |col, col_idx|
      col.map.with_index do |_, row_idx|
        matrix[row_idx][col_idx]
      end
    end
  end

  def test_1
    # skip
    expected = [[1], [2], [3], [4]]
    result = transpose([[1, 2, 3, 4]])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [[1, 2, 3, 4]]
    result = transpose([[1], [2], [3], [4]])
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
    result = transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
    assert_equal(expected, result)
  end

  def test_4
    # skip
    expected = [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]
    result = transpose([[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]])
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = [[1]]
    result = transpose([[1]])
    assert_equal(expected, result)
  end

  def test_6
    # skip
    expected = [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
    result = transpose([[1, 5, 8], [4, 7, 2], [3, 9, 6]])
    assert_equal(expected, result)
  end
  
end

class FourthExerciseMostClever < Minitest::Test

  def transpose(matrix)
    # matrix[0] gives the number of columns, then
    # he dealt with the rows afterwards
    matrix[0].map.with_index do |_, i|
      matrix.map { |row| row[i] }
    end
  end

  def test_1
    # skip
    expected = [[1], [2], [3], [4]]
    result = transpose([[1, 2, 3, 4]])
    assert_equal(expected, result)
  end
  
  def test_2
    # skip
    expected = [[1, 2, 3, 4]]
    result = transpose([[1], [2], [3], [4]])
    assert_equal(expected, result)
  end
  
  def test_3
    # skip
    expected = [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
    result = transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]])
    assert_equal(expected, result)
  end

  def test_4
    # skip
    expected = [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]
    result = transpose([[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]])
    assert_equal(expected, result)
  end
  
  def test_5
    # skip
    expected = [[1]]
    result = transpose([[1]])
    assert_equal(expected, result)
  end

  def test_6
    # skip
    expected = [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
    result = transpose([[1, 5, 8], [4, 7, 2], [3, 9, 6]])
    assert_equal(expected, result)
  end
  
end