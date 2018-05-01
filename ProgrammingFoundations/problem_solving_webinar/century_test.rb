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
    else upper_century(century)    
    end    
  end

  def lower_century(century)
    case century
    when 1 then century.to_s + "st"
    when 2 then century.to_s + "nd"
    when 3 then century.to_s + "rd"
    else century.to_s + "th"
    end
  end

  def upper_century(century)
    last_century_digit = century % 10
    case last_century_digit
    when 1 then century.to_s + "st"
    when 2 then century.to_s + "nd"
    when 3 then century.to_s + "rd"
    else century.to_s + "th"  
    end      
  end  

  def test_first_century
    years = [1, 51, 100]
    assert(years.all? {|year| century(year) == '1st'})
  end

  def test_second_century
    years = [101, 175, 200]
    assert(years.all? {|year| century(year) == '2nd'})      
  end

  def test_third_century
    years = [201, 215, 300]
    assert(years.all? {|year| century(year) == '3rd'})      
  end

  def test_11_12_13_centuries
    expected = ['11th', '12th', '13th']
    assert_equal(expected, [century(1052), century(1152), century(1252)])
  end

  def test_21st_22nd_23rd_centuries
    expected = %W(21st 22nd 23rd)
    assert_equal(expected, [century(2012), century(2112), century(2250)])
  end

  def test_larger_centuries
    expected = %W(223rd 226th)
    assert_equal(expected, [century(22222), century(22512)])
  end

end