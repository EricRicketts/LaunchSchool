require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Grade Book

Write a method that determines the mean (average) of the three scores
passed to it, and returns the letter value associated with that grade.

Numerical Score Letter  Grade
90 <= score <= 100  'A'
80 <= score < 90  'B'
70 <= score < 80  'C'
60 <= score < 70  'D'
0 <= score < 60 'F'
Tested values are all between 0 and 100. There is no need to check
for negative values or values greater than 100.

Example:

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

sum the numbers
use a case statement for the ranges
=end

class NinthExercise < Minitest::Test

  # this is the LS solution it also handles additional grades
  # beyond 3 entries
  def get_grade(*grades)
    avg = grades.sum/(grades.length * 1.0)
    case avg
    when (90..100) then "A"
    when (80...90) then "B"
    when (70...80) then "C"
    when (60...70) then "D"
    else "F"
    end
  end

  def test_0
    # skip
    assert_equal("A", get_grade(95, 90, 93))
  end
  
  def test_1
    # skip
    assert_equal("D", get_grade(50, 50, 95))
  end
  
  def test_2
    # skip
    assert_equal("B", get_grade(50, 100, 80, 90, 85))
  end
  
end