require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Rotating Matrices
As we saw in the previous exercises, a matrix can be represented in ruby by an Array of Arrays. For example:

1  5  8
4  7  2
3  9  6

can be described by the Array of Arrays:

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

A 90-degree rotation of a matrix produces a new matrix in which each side of the matrix is rotated clockwise
by 90 degrees. For example, the 90-degree rotation of the matrix shown above is:

3  4  1
9  7  5
6  2  8

A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

3  4  1
9  7  5
is:

9  3
7  4
5  1

Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

Examples

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2
This program should print "true" three times.

=end

class FifthExercise < Minitest::Test

  def rotate90(matrix)
    rows, cols = matrix.size, matrix.first.size
    Array.new(cols) { Array.new(rows) }.map.with_index do |col, col_idx|
      col.map.with_index do |_, row_idx|
        matrix[row_idx][col_idx]
      end.reverse
    end
  end

  def setup
    @matrix1 = [
      [1, 5, 8],
      [4, 7, 2],
      [3, 9, 6]
    ]

    @matrix2 = [
      [3, 7, 4, 2],
      [5, 1, 0, 8]
    ]    
  end

  def test_1
    # skip
    expected = [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
    assert_equal(expected, rotate90(@matrix1))
  end
  
  def test_2
    # skip
    expected = [[5, 3], [1, 7], [0, 4], [8, 2]]
    assert_equal(expected, rotate90(@matrix2))
  end

  def test_3
    # skip
    matrix = [[5, 3], [1, 7], [0, 4], [8, 2]]
    expected = [[8, 0, 1, 5], [2, 4, 7, 3]]
    assert_equal(expected, rotate90(matrix))
  end

  def test_4
    # skip
    result = rotate90(rotate90(rotate90(rotate90(@matrix2))))
    assert_equal(@matrix2, result)
  end
  
end