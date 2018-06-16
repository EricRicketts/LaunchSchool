require 'date'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an argument.
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern
Gregorian Calendar) and that it will remain in use for the foreseeable future.

Examples:

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

AL:
  - iterate through all the months (1..12)
  - use Time.new(year, month, day) to get the day
  - call friday?  on the day and select all Fridays
  - count the number of Fridays
=end

class SeventhExercise < Minitest::Test

  def friday_13th(year)
    (1..12).select {|month| Time.new(year, month, 13).friday?}.count
  end

  def test_0
    # skip
    assert_equal(3, friday_13th(2015))
  end

  def test_1
    # skip
    assert_equal(1, friday_13th(1986))
  end

  def test_2
    # skip
    assert_equal(2, friday_13th(2019))
  end

end

class SeventhExerciseLS < Minitest::Test
=begin
they make use of next_month which Time also has
=end

  def friday_13th(year)
    unlucky_count = 0
    thirteenth = Date.new(year, 1, 13)
    12.times do
      unlucky_count += 1 if thirteenth.friday?
      thirteenth = thirteenth.next_month
    end
    unlucky_count
  end

  def test_0
    # skip
    assert_equal(3, friday_13th(2015))
  end

  def test_1
    # skip
    assert_equal(1, friday_13th(1986))
  end

  def test_2
    # skip
    assert_equal(2, friday_13th(2019))
  end

end