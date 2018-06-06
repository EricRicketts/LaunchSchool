require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
After Midnight (Part 2)

As seen in the previous exercise, the time of day can be represented
as the number of minutes before or after midnight. If the number of
minutes is positive, the time is after midnight. If the number of
minutes is negative, the time is before midnight.

Write two methods that each take a time of day in 24 hour format,
and return the number of minutes before and after midnight, respectively.
Both methods should return a value in the range 0..1439.

You may not use ruby's Date and Time methods.

after_midnight('00:00') == 0
before_midnight('00:00') == 0
after_midnight('12:34') == 754
before_midnight('12:34') == 686
after_midnight('24:00') == 0
before_midnight('24:00') == 0

AL:
  - for after midnight
    take the hous*60 + minutes

  - for before midnight
    take the hours*60 + minutes subtract from minutes per day
=end

class ThirdExercise < Minitest::Test

  MINUTES_PER_HOUR = 60
  HOURS_PER_DAY = 24
  MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

  def after_midnight(time)
    hours, minutes = time.split(":").map(&:to_i)
    (hours*MINUTES_PER_HOUR + minutes).divmod(MINUTES_PER_DAY).last
  end

  def before_midnight(time)
    hours, minutes = time.split(":").map(&:to_i)
    minutes_before_midnight = MINUTES_PER_DAY - (hours*MINUTES_PER_HOUR + minutes)
    minutes_before_midnight.divmod(MINUTES_PER_DAY).last
  end

  def test_0
    # skip
    assert_equal(0, after_midnight('00:00'))
  end
  
  def test_1
    # skip
    assert_equal(0, before_midnight('00:00'))
  end
  
  def test_2
    # skip
    assert_equal(754, after_midnight('12:34'))
  end
  
  def test_3
    # skip
    assert_equal(686, before_midnight('12:34'))
  end
  
  def test_4
    # skip
    assert_equal(0, after_midnight('24:00'))
  end
  
  def test_5
    # skip
    assert_equal(0, before_midnight('24:00'))
  end
  
end