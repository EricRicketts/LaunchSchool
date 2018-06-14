require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

=begin
Leap Years (Part 2)

A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year. Prior to 1752, the Julian Calendar was used.
Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.

leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

Input: integer representing year
Output: boolean true if leap year

Algorithm:
  - divisible by 4 and not divisible by 100
  - OR
  - divisible by 400

=end

  def leap_year?(year)
    if year < 1752
      (year % 4).zero?
    else
      ((year % 4).zero? && !(year % 100).zero?) || (year % 400).zero?
    end
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
    assert(leap_year?(1700))    
  end 

  def test_eleven
    refute(leap_year?(1))    
  end 

  def test_twelve
    assert(leap_year?(100))    
  end 

  def test_thirteen
    assert(leap_year?(400))    
  end 

end