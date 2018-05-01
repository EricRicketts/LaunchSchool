require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
What Century Is That:

Write a function that takes an integer year as input and returns the century.  The return value should be a string that
begins with the century number and ends with st, nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01.  So, the years 1901-2000 comprise the 20th century.

Understanding the problem:

- Input
  - integer number
  - need to validate?
- Output
  - a string
  - begins with the century number
  - ends with st, nd, rd, or th
- Rules
  - new centuries begin in years that end with 01
  - century string number into a string:
    - 1: st
    - 2: nd
    - 3: rd
    - 4-20: th
    - 21: st
    - 22: nd
    - 23: rd
    - 24-30: th
    ...
    - generalize
      - century_number % 10
        - 1, 2, 3: st, nd, rd
        - 0, 4-9: th
        - except for 11, 12, 13: th
        
- Examples / Test Cases:
  - notice the test cases cover the boundary conditions, on the edge of one century and following one
century(1)     => '1st'
century(100)   => '1st'
century(133)   => '2nd'
century(245)   => '3rd'
century(1052)  => '11th'
century(1152)  => '12th'
century(1252)  => '13th'
century(2012)  => '21st'
century(2112)  => '22nd'
century(22222) => '223rd'
century(22512) => '226th'
=end

class CenturyTest < Minitest::Test


  def century(year)
    century, years_in_century = year.divmod(100)
    century += 1 if years_in_century >= 1
    case century
    when (0..20) then lower_century(century)    
    end    
  end

  def lower_century(century)
    case century
    when 1 then century.to_s + "st"
    when 2 then century.to_s + "nd"
    when 3 then century.to_s + "rd"
    when (4..20) then century.to_s + "th"
    end
  end  

  def test_first_century
    assert_equal('1st', century(1))
  end

  def test_in_first_century
    assert_equal('1st', century(51))
  end

  def test_last_in_first_century
    assert_equal('1st', century(100))
  end

  def test_second_century
    assert_equal('2nd', century(101))      
  end

  def test_in_second_century
    assert_equal('2nd', century(175))      
  end

  def test_last_in_second_century
    assert_equal('2nd', century(200))      
  end

  def test_third_century
    assert_equal('3rd', century(201))      
  end

  def test_in_third_century
    assert_equal('3rd', century(215))      
  end

  def test_last_in_third_century
    assert_equal('3rd', century(300))      
  end

end