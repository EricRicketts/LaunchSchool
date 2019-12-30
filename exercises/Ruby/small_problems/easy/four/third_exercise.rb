require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class ThirdExercise < Minitest::Test

=begin
Leap Years (Part 1)

In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4,
unless the year is also divisible by 100. If the year is evenly divisible by 100, then it is not a leap year
unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that takes any year greater than 0 as input,
and returns true if the year is a leap year, or false if it is not a leap year.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

Input: integer representing year
Output: boolean true if leap year

Algorithm:
  - divisible by 4 and not divisible by 100
  - OR
  - divisible by 400

=end

  def leap_year?(year)
    ((year % 4).zero? && !(year % 100).zero?) || (year % 400).zero?    
  end

  def test_one
    assert(leap_year?(2016))    
  end 

  def test_two
    refute(leap_year?(2015))    
  end 

  def test_three
    refute(leap_year?(2100))    
  end 

  def test_four
    assert(leap_year?(2400))    
  end 

  def test_five
    assert(leap_year?(240_000))    
  end 

  def test_six
    refute(leap_year?(240_001))    
  end 

  def test_seven
    assert(leap_year?(2000))    
  end 

  def test_eight
    refute(leap_year?(1900))    
  end 

  def test_nine
    assert(leap_year?(1752))    
  end 

  def test_ten
    refute(leap_year?(1700))    
  end 

  def test_eleven
    refute(leap_year?(1))    
  end 

  def test_twelve
    refute(leap_year?(100))    
  end 

  def test_thirteen
    assert(leap_year?(400))    
  end 

end