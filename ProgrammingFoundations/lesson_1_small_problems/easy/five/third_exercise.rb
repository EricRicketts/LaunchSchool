require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class ThirdExercise < Minitest::Test

=begin
After Midnight (Part 2)

As seen in the previous exercise, the time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return the number of minutes before and after midnight,
respectively. Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

Examples:

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

Input: A string in 24 hour format 'hh:mm'
Output: An integer with value between 0..1439

Algorithm:
  - for after_midnight
    - hrs, min = split on the ":"
    - total_min = (hrs.to_i*60) % 1440 + min.to_i
  - for before_midnight
    - we use after_midnight and just subtract from
    MINUTES_PER_DAY
=end

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def after_midnight(time)
    hrs, mins = time.split(":")
    (hrs.to_i*MINUTES_PER_HOUR % MINUTES_PER_DAY) + mins.to_i
  end

  def before_midnight(time)
    (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
  end

  def test_1
    assert_equal(0, after_midnight('00:00'))    
  end  

  def test_2
    assert_equal(0, before_midnight('00:00'))    
  end  

  def test_3
    assert_equal(754, after_midnight('12:34'))    
  end  

  def test_4
    assert_equal(686, before_midnight('12:34'))    
  end  

  def test_5
    assert_equal(0, after_midnight('24:00'))    
  end  

  def test_6
    assert_equal(0, before_midnight('24:00'))    
  end  

end

class ThirdExerciseLS < Minitest::Test

=begin
I like this solution because of the #map(&to_i)
basically the same idea as I had by using subtraction
=end

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60
  MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

  def after_midnight(time_str)
    hours, minutes = time_str.split(':').map(&:to_i)
    (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
  end

  def before_midnight(time_str)
    delta_minutes = MINUTES_PER_DAY - after_midnight(time_str)
    delta_minutes = 0 if delta_minutes == MINUTES_PER_DAY
    delta_minutes
  end

  def test_1
    assert_equal(0, after_midnight('00:00'))    
  end  

  def test_2
    assert_equal(0, before_midnight('00:00'))    
  end  

  def test_3
    assert_equal(754, after_midnight('12:34'))    
  end  

  def test_4
    assert_equal(686, before_midnight('12:34'))    
  end  

  def test_5
    assert_equal(0, after_midnight('24:00'))    
  end  

  def test_6
    assert_equal(0, before_midnight('24:00'))    
  end  
  
end