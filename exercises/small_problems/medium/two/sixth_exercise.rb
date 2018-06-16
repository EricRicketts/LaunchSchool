require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Tri-Angles

A triangle is classified as follows:

right One angle of the triangle is a right angle (90 degrees)
acute All 3 angles of the triangle are less than 90 degrees
obtuse One angle is greater than 90 degrees.

To be a valid triangle, the sum of the angles must be exactly 180 degrees,
and all angles must be greater than 0: if either of these conditions is not satisfied,
the triangle is invalid.

Write a method that takes the 3 angles of a triangle as arguments, and returns a symbol
:right, :acute, :obtuse, or :invalid depending on whether the triangle is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating point errors.
You may also assume that the arguments are specified in degrees.

Examples:

triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

AL:
  - as with the last problem
  make the methods
    - do invalid
    - then do actue
    - then do right
    - so if the triangle is valid
    and not right or actue then one angle
    must be over 90
=end

class SixthExercise < Minitest::Test

  def invalid(angles)
    angles.include?(0) || angles.sum != 180
  end

  def acute(angles)
    angles.max < 90
  end

  def right(angles)
    angles.count(90) == 1
  end

  def triangle(*angles)
    case 
    when invalid(angles) then :invalid
    when acute(angles) then :acute
    when right(angles) then :right
    else :obtuse
    end
  end

  def test_0
    # skip
    assert_equal(:acute, triangle(60, 70, 50))
  end
  
  def test_1
    # skip
    assert_equal(:right, triangle(30, 90, 60))
  end
  
  def test_2
    # skip
    assert_equal(:obtuse, triangle(120, 50, 10))
  end
  
  def test_3
    # skip
    assert_equal(:invalid, triangle(0, 90, 90))
  end
  
  def test_4
    # skip
    assert_equal(:invalid, triangle(50, 50, 50))
  end
  
end