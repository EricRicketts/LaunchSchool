require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Leap Years (Part 1)

In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4,
unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year
unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0
as input, and returns true if the year is a leap year, or false if it is not a leap year.

0. leap_year?(2016) == true
1. leap_year?(2015) == false
2. leap_year?(2100) == false
3. leap_year?(2400) == true
4. leap_year?(240000) == true
5. leap_year?(240001) == false
6. leap_year?(2000) == true
7. leap_year?(1900) == false
8. leap_year?(1752) == true
9. leap_year?(1700) == false
10. leap_year?(1) == false
11. leap_year?(100) == false
12. leap_year?(400) == true

AL:
  - year % 400 true
  - year % 100 false
  - year % 4 true 
=end

class ThirdExercise < Minitest::Test
  
  def leap_year?(year)
    (year % 400).zero? || (!(year % 100).zero? && (year % 4).zero?)
  end

  def test_0
    # skip
    assert(leap_year?(2016))
  end

  def test_1
    # skip
    refute(leap_year?(2015))
  end

  def test_2
    # skip
    refute(leap_year?(2100))
  end

  def test_3
    # skip
    assert(leap_year?(2400))
  end

  def test_4
    # skip
    assert(leap_year?(240000))
  end

  def test_5
    # skip
    refute(leap_year?(240001))
  end

  def test_6
    # skip
    assert(leap_year?(2000))
  end

  def test_7
    # skip
    refute(leap_year?(1900))
  end

  def test_8
    # skip
    assert(leap_year?(1752))
  end

  def test_9
    # skip
    refute(leap_year?(1700))
  end

  def test_10
    # skip
    refute(leap_year?(1))
  end

  def test_11
    # skip
    refute(leap_year?(100))
  end

  def test_12
    # skip
    assert(leap_year?(400))
  end

end