require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Cute Angles

Write a method that takes a floating point number that represents an angle between 0 and 360 degrees and returns a
String that represents that angle in degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to represent seconds. A degree has 60 minutes,
while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"

AL:
  - Need to convert an integer into a floating point
  - the whole number needs to be % 360 to get the degrees
  - need to split the floating point into the whole number and the fraction
  - the initial fractional part needs to be multiplied by 60 to get minutes
  - the result needs to be % 60 to get minutes and seconds
  - the remaining decimal needs to be * 60 to get the seconds
=end

class FirstExercise < Minitest::Test

  DEGREES_ONE_ROTATION = 360.0
  MINUTES_IN_DEGREE = 60.0
  SECONDS_IN_MINUTE = 60.0
  DEGREE = "\xC2\xB0"

  def dms(num)
    rotations, degrees = num.divmod(DEGREES_ONE_ROTATION)
    whole_degrees = degrees.truncate
    fractional_minutes_and_seconds = degrees - whole_degrees
    minutes = fractional_minutes_and_seconds * MINUTES_IN_DEGREE
    whole_minutes = minutes.truncate
    fractional_seconds = minutes - whole_minutes
    whole_seconds = fractional_seconds * SECONDS_IN_MINUTE 
    "#{whole_degrees}" + DEGREE + format("%02d", whole_minutes) + "'" + format("%02d", whole_seconds) + "\""
  end

  def test_1
    assert_equal("30°00'00\"", dms(30))      
  end

  def test_2
    assert_equal("76°43'48\"", dms(76.73))      
  end

  def test_3
    # original solution was %(254°36'00") but my answer
    # is within a second of this result, according to
    # the problem statement this is permissible
    assert_equal("254°35'59\"", dms(254.6))      
  end

  def test_4
    assert_equal("93°02'05\"", dms(93.034773))      
  end

  def test_5
    assert_equal("0°00'00\"", dms(0))      
  end

  def test_6
    # can be either %(360°00'00") or %(0°00'00")
    assert_equal("0°00'00\"", dms(360))      
  end

  def test_7
    assert_equal("90°30'00\"", dms(450.5))
  end

end

class FirstExerciseLS < Minitest::Test

  DEGREE = "\xC2\xB0"
  MINUTES_PER_DEGREE = 60
  SECONDS_PER_MINUTE = 60
  SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

  def dms(degrees_float)
    total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
    degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
    minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
    format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  end

  def test_1
    assert_equal("30°00'00\"", dms(30))      
  end

  def test_2
    assert_equal("76°43'48\"", dms(76.73))      
  end

  def test_3
    # original solution was %(254°36'00") but my answer
    # is within a second of this result, according to
    # the problem statement this is permissible
    assert_equal("254°36'00\"", dms(254.6))      
  end

  def test_4
    assert_equal("93°02'05\"", dms(93.034773))      
  end

  def test_5
    assert_equal("0°00'00\"", dms(0))      
  end

  def test_6
    # can be either %(360°00'00") or %(0°00'00")
    assert_equal("360°00'00\"", dms(360))      
  end

  def test_7
    # technically this solution is incorrect
    # as making one full 360 degree rotation
    # resets the degree count, nobody has 450
    # degress on their protractor
    assert_equal("450°30'00\"", dms(450.5))
  end  
end