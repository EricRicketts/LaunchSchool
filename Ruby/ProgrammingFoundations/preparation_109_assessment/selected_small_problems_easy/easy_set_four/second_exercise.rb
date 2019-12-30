require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
What Century Is That?

Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century
number, and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

Examples:

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

AL
  - take the number and divmod(100)
  - if the result of last is > 0 then add 1 to first
  - now take first and convert to a string
  - if the string ends in 1 => st, 2 => nd, 3 => rd
=end

class SecondExercise < Minitest::Test

  CENTURY_SUFFIX = {
    '1' => 'st', '2' => 'nd', '3' => 'rd', '4' => 'th',
    '5' => 'th', '6' => 'th', '7' => 'th', '8' => 'th',
    '9' => 'th', '0' => 'th'
  }

  def century(num)
    cent, remain = num.divmod(100)
    cent += 1 if remain > 0
    str_cent = cent.to_s
    return str_cent + CENTURY_SUFFIX[str_cent[-1]] if str_cent.length == 1

    suffix = str_cent[-2..-1]
    ending = ['11', '12', '13'].include?(suffix) ? 'th' : CENTURY_SUFFIX[str_cent[-1]]
    str_cent + ending
  end

  def test_0
    # skip 
    assert_equal('20th', century(2000))
  end
  
  def test_1
    # skip
    assert_equal('21st', century(2001))
  end
  
  def test_2
    # skip
    assert_equal('20th', century(1965))
  end
  
  def test_3
    # skip
    assert_equal('3rd', century(256))
  end
  
  def test_4
    # skip
    assert_equal('1st', century(5))
  end
  
  def test_5
    # skip
    assert_equal('102nd', century(10103))
  end
  
  def test_6
    # skip
    assert_equal('11th', century(1052))
  end
  
  def test_7
    # skip
    assert_equal('12th', century(1127))
  end
  
  def test_8
    # skip
    assert_equal('113th', century(11201))
  end
  
end