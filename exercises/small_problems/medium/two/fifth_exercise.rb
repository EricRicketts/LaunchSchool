require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Triangle Sides

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides
must be greater than the length of the longest side, and all sides must
have lengths greater than 0: if either of these conditions is not satisfied,
the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

AL:
  - develop methods for each option
    - invalid
    - equilateral
    - isosceles
    - scalene
  - case sides
    invalid then :invalid
    equilateral then :equilateral
    isosceles then :isosceles
    scalene then :scalene
=end

class FifthExercise < Minitest::Test

  def invalid(sides)
    sides.any?(&:zero?) || sides.min(2).sum < sides.max
  end

  def equilateral(sides)
    sides.uniq.length == 1
  end

  def isosceles(sides)
    sides.uniq.length == 2
  end

  def triangle(*sides)
    case
    when invalid(sides) then :invalid
    when equilateral(sides) then :equilateral
    when isosceles(sides) then :isosceles
    else :scalene
    end
  end

  def test_0
    # skip
    assert_equal(:equilateral, triangle(3, 3, 3)) 
  end
  
  def test_1
    # skip
    assert_equal(:isosceles, triangle(3, 3, 1.5)) 
  end
  
  def test_2
    # skip
    assert_equal(:scalene, triangle(3, 4, 5)) 
  end
  
  def test_3
    # skip
    assert_equal(:invalid, triangle(0, 3, 3)) 
  end
  
  def test_4
    # skip
    assert_equal(:invalid, triangle(3, 1, 1)) 
  end
  
end