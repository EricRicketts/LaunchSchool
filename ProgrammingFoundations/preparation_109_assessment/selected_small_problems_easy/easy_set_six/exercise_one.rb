require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Cute Angles

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees
and returns a String that represents that angle in degrees, minutes and seconds. You should use a
degree symbol (°) to represent degrees, a single quote (') to represent minutes, and a double quote
(") to represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
Note: your results may differ slightly depending on how you round values,
but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the
minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

AL:
  - divmod the number by 360
    - remainder is degrees, minutes and seconds
    - subtract out the floor value to get the decimal
    - multiply the decimal by 60 to get the minutes
    - subract out the floor value, the remainder is seconds
    - format the output using format
=end

class ExerciseOne < Minitest::Test

  MINUTES_PER_DEGREE = 60
  SECONDS_PER_MINUTE = 60
  FULL_CIRCLE = 360

  def dms(num)
    rotations, deg_min_sec = num.divmod(FULL_CIRCLE)
    deg = deg_min_sec.floor
    min_sec = (deg_min_sec - deg)*MINUTES_PER_DEGREE
    min = min_sec.floor
    sec = ((min_sec - min)*SECONDS_PER_MINUTE).floor
    deg_str = deg.to_s + "\xC2\xB0"
    min_str = format("%02d'", min)
    sec_str = format("%02d", sec) + '"'
    deg_str + min_str + sec_str
  end

  def test_0
    # skip
    assert_equal(%(30°00'00"), dms(30))
  end
  
  def test_1
    # skip
    assert_equal(%(76°43'48"), dms(76.73))
  end
  
  def test_2
    # skip
    assert_equal(%(254°35'59"), dms(254.6))
  end
  
  def test_3
    # skip
    assert_equal(%(93°02'05"), dms(93.034773))
  end
  
  def test_4
    # skip
    assert_equal(%(0°00'00"), dms(0))
  end
  
  def test_5
    # skip
    assert_equal(%(0°00'00"), dms(360))
  end
  
end