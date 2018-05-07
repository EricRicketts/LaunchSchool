require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
What Century Is That?

Write a method that takes a year as input and returns the century.
The return value should be a string that begins with the century number,and
ends with st, nd, rd, or th as appropriate for that number.

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
century(11201) == '113th

Input: an integer
Output: A string indicating what century the year is in

Algorithm:
  - centuries are from 1 to 0, that is the first century is from 1 to 100
  - first get a number representing the century number.divmod(100), if the remainder
  is 0, then add 1 to the century
  - if the century ends in 1 then suffix is 'st'
  - if the century ends in 2 then the suffix is 'rd'
  - if the century ends in 3 then the suffix is 'rd'
  - otherwise century ends in 'th'
  - exceptin are 11th, 12th, and 13th centuries
  - after the divmod we have no choice but to check for 11, 12, or 13
  - otherwise
    - convert the century to a string
    - take the last char of the string and run it through a hash of suffixes
=end

class SecondExercise < Minitest::Test

  CENT_SUFFIXES = {'0' => 'th', '1' => 'st', '2' => 'nd', '3' => 'rd',
    '4' => 'th', '5' => 'th', '6' => 'th', '7' => 'th', '8' => 'th',
    '9' => 'th'}

def century(year)
  century, remainder = year.divmod(100)
  century += 1 unless remainder.zero?
  last_two_digits_of_century = century.divmod(100).last
  case last_two_digits_of_century
  when 11, 12, 13
    century.to_s + 'th'
  else
    century.to_s + CENT_SUFFIXES[century.to_s[-1]]
  end
end

  def test_one
    assert_equal('20th', century(2000))    
  end
  
  def test_two
    assert_equal('21st', century(2001))    
  end
  
  def test_three
    assert_equal('20th', century(1965))    
  end
  
  def test_four
    assert_equal('3rd', century(256))    
  end
  
  def test_five
    assert_equal('1st', century(5))    
  end
  
  def test_six
    assert_equal('102nd', century(10103))    
  end
  
  def test_seven
    assert_equal('11th', century(1052))    
  end
  
  def test_eight
    assert_equal('12th', century(1127))    
  end

  def test_nine
    assert_equal('13th', century(1245))
  end
  
  def test_ten
    assert_equal('113th', century(11201))    
  end
  
end

class SecondExerciseAnother < Minitest::Test

=begin
I like Kramer's solution, I forgot to generalize
anytime the century remainder is in the teens or
begins with 1, then the ending is always 'th'
the (year + 99) / 100 might be a bit tricky 
to understand
=end
  def century(year)
    hundreds = ( (year + 99) / 100 ).to_s
    if hundreds[-2] == '1'
      suffix = 'th'
    else
      last_digit = hundreds[-1]
      case last_digit
      when '1' then suffix = 'st'
      when '2' then suffix = 'nd'
      when '3' then suffix = 'rd'
      else suffix = 'th'
      end
    end
    hundreds + suffix
  end

  def test_one
    assert_equal('20th', century(2000))    
  end
  
  def test_two
    assert_equal('21st', century(2001))    
  end
  
  def test_three
    assert_equal('20th', century(1965))    
  end
  
  def test_four
    assert_equal('3rd', century(256))    
  end
  
  def test_five
    assert_equal('1st', century(5))    
  end
  
  def test_six
    assert_equal('102nd', century(10103))    
  end
  
  def test_seven
    assert_equal('11th', century(1052))    
  end
  
  def test_eight
    assert_equal('12th', century(1127))    
  end

  def test_nine
    assert_equal('13th', century(1245))
  end
  
  def test_ten
    assert_equal('113th', century(11201))
  end
  
end