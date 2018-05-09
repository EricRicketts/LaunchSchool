require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class SecondExercise < Minitest::Test

=begin
After Midnight (Part 1)

The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns
the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

Disregard Daylight Savings and Standard Time and other complications.

Input: A signed integer number representing minutes
Output: A string in 24 hour clock format where hours
and and minutes are separated by a ":"

Algorithm:
  - There are 24*60 = 1440 minutest in a day
  - for a positive number
    - so divide the number by 1440 to get the number
      of days, this is leaves us with the number of minutes
      in a day, as the remainder
    - Take this reminader and then divmod(60) which are
    the number of minutes in an hour
      - we have hours, minutes = num.divmod(60)
        - if hours < 10 then prepend '0'
        - if minutes < 10 then prepend '0'
=end

  def time_of_day(total_minutes)
    days, total_mins_in_day = total_minutes.divmod(24*60)
    hrs, mins = total_mins_in_day.divmod(60)
    hrs = hrs < 10 ? ('0' + hrs.to_s) : (hrs.to_s)
    mins = mins < 10 ? ('0' + mins.to_s) : (mins.to_s)
    hrs + ":" + mins
  end

  def test_one
    assert_equal("00:00", time_of_day(0))
  end
  
  def test_two
    assert_equal("23:57", time_of_day(-3))
  end
  
  def test_three
    assert_equal("00:35", time_of_day(35))
  end
  
  def test_four
    assert_equal("00:03", time_of_day(-1437))
  end
  
  def test_five
    assert_equal("02:00", time_of_day(3000))
  end
  
  def test_six
    assert_equal("13:20", time_of_day(800))
  end
  
  def test_seven
    assert_equal("01:29", time_of_day(-4231))
  end
  
end

class SecondExerciseLS < Minitest::Test

=begin
I like this solution better because of the use
of constants and because no conversion was needed
between integer and string by using the #format method
=end
  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def time_of_day(delta_minutes)
    delta_minutes =  delta_minutes % MINUTES_PER_DAY
    hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
    format('%02d:%02d', hours, minutes)
  end

  def test_one
    assert_equal("00:00", time_of_day(0))
  end
  
  def test_two
    assert_equal("23:57", time_of_day(-3))
  end
  
  def test_three
    assert_equal("00:35", time_of_day(35))
  end
  
  def test_four
    assert_equal("00:03", time_of_day(-1437))
  end
  
  def test_five
    assert_equal("02:00", time_of_day(3000))
  end
  
  def test_six
    assert_equal("13:20", time_of_day(800))
  end
  
  def test_seven
    assert_equal("01:29", time_of_day(-4231))
  end  
  
end