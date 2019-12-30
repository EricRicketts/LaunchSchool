require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
After Midnight (Part 1)

The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. If the number of
minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time
of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

AL:
  - there are 60 minutes in an hour
  and there are 24 hours in a day
  - so in a day there are 68*24 = 1440 minutes
  - we want to get minutes after we have a whole
  number of days
=end

class SecondExercise < Minitest::Test

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def time_of_day(total_minutes)
    days, remaining_minutes = total_minutes.divmod(MINUTES_PER_DAY)
    hours, minutes = remaining_minutes.divmod(MINUTES_PER_HOUR)
    format('%02d:%02d', hours, minutes)
  end

  def test_0
    # skip
    assert_equal('00:00', time_of_day(0))
  end
  
  def test_1
    # skip
    assert_equal('23:57', time_of_day(-3))
  end
  
  def test_2
    # skip
    assert_equal('00:35', time_of_day(35))
  end
  
  def test_3
    # skip
    assert_equal('00:03', time_of_day(-1437))
  end
  
  def test_4
    # skip
    assert_equal('02:00', time_of_day(3000))
  end
  
  def test_5
    # skip
    assert_equal('13:20', time_of_day(800))
  end
  
  def test_6
    # skip
    assert_equal('01:29', time_of_day(-4231))
  end
  
end