=begin

you need to create a method that when provided with a triplet,
 returns the index of the numerical element that lies between
  the other two elements.

Input: an array of 3 numbers, positive or negative, could be 0
Output: single number which tells how which index has the number
which is between the other numbers

algorithm:
- make another array by sorting
- get the middle number
- get the index of the middle number in the original array

=end

# gimme([2, 3, 1]) == 0
#
# gimme([5, 10, 14]) == 1
#
# gimme([1, 3, 4]) == 1
#
# gimme([-15, -10, 14]) == 1

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Session2TestFirstProblem < Minitest::Test

  def gimmie(tuple)
    sorted_tuple = tuple.sort
    middle_number = sorted_tuple[1]
    tuple.index(middle_number)        
  end

  def test_one
    assert_equal(0, gimmie([2, 3, 1]))  
  end
  
  def test_two
    assert_equal(1, gimmie([5, 10, 14]))  
  end
  
  def test_three
    assert_equal(1, gimmie([1, 3, 4]))  
  end
  
  def test_four
    assert_equal(1, gimmie([-15, -10, 14]))  
  end
  
end

class Session2TestSecondProblem < Minitest::Test

=begin
  Given 2 strings, your job is to find out if there is a substring
  that appears in both strings. You will return true if you find a
  substring that appears in both strings, or false if you do not.
   We only care about substrings that are longer than one letter long.

input
  - 2 strings
output: boolean
  - true if one substring appears in the other substring

Questions:
  - letter for letter even if repeated

Algorithm
  - take smaller string cycle through each letter
  - is each letter in the other array
  - call all? on that
=end

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('test', 'lllt') == false
# p substring_test('', '') == false
# p substring_test('1234567', '541265') == true
# p substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou') == true

=begin
I did not understand the problem, Something, Home both share the substring 'ome'

Key points:
  - We are looking for a substring that is common to both strings
  - This common substring has to be >= 2 characters
  - once we find just one common substring we can exit

Algorithm
  - 
str = 'abcde'
ary = []
0.upto(str.length - 1) do |index|
  next if index.zero?
  ary.push(str[0..index])
end

0.upto(str.length - 2) do |index|
  arr.push(str[index..str.length-1])
end 
=end

=begin

def substring(str)
  result = []
  0.upto(str.size - 2) do |start_idx|
    1.upto(str.size - 1) do |end_idx|
      result << str[start_idx..end_idx] if end_idx > start_idx
    end
  end
  result
end

def substring_test(str1, str2)
  str1_substrings = substring(str1)
  str1_substrings.each do |substring|
    return true if str2.downcase.include?(substring.downcase)
  end
  false
end

=end

  def substring(str)
    str_down = str.downcase
    ary, arr = [], []
    0.upto(str_down.length - 2) do |index|
      arr.push(str_down[index..str_down.length-1])
    end

    arr.each do |string|
      0.upto(string.length - 1) do |index|
        next if index.zero?
        ary.push(string[0..index])
      end      
    end
    ary         
  end

  def substring_test(str1, str2)
    ary_substr1 = substring(str1)
    ary_substr1.any? {|str| substring(str2).include?(str)}
  end

  def test_one
    refute(substring_test('Something', 'Fun'))  
  end
  
  def test_two
    assert(substring_test('Something', 'Home'))  
  end
  
  def test_three
    refute(substring_test('Something', ''))  
  end
  
  def test_four
    refute(substring_test('', 'Something'))  
  end
    
  def test_four
    refute(substring_test('', ''))  
  end

  def test_five
    assert(substring_test('BANANA', 'banana'))
  end

  def test_six
    refute(substring_test('test', 'lllt'))
  end

  def test_seven
    refute(substring_test('', ''))
  end

  def test_eight
    assert(substring_test('1234567', '541265'))
  end

  def test_nine
    assert(substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou'))
  end
    
end

class Session2TestSrdjn < Minitest::Test

=begin
this is a much better solution that the one I came up with, notice in his substring method
let us take 'abcdef' at the input string.  In the outer loop, we go from 0 to 4 because
'abcdef'.length - 2 = 4.  The problem required the substring to be >= 2 characters so
we keep the largest starting index 2 away from the end of the string so we can guarantee
the last substring will have 2 characters.

so for 'abcdef' the first starting index is 0 which is the character 'a', then we
go to the inner loop where we are looping through the end indices, the lowest
ending index is 1 (because we want substrings of length 2 or more), so our first
substring is doing to be 'abcdef'[start_idx..end_idx] = 'abcdef'[0..1], which gives 'ab',
then the next end_idx value is going to be 2 which gives 'abcdef'[0..2] = 'abc'

once this process ends for start_idx = 0, the outer loop is called again and start_idx = 1
which gives 'b' as the first character.  We now find all of the substrings for the string
'bcdef'

the substring_test method is also better than mine (though I do like my comment alternative)
I had no idea of that #include? was part of the String class, this greatly simplified his code.
=end
  def substring(str)
    string = str.downcase
    result = []
    0.upto(string.size - 2) do |start_idx|
      1.upto(string.size - 1) do |end_idx|
        result << string[start_idx..end_idx] if end_idx > start_idx
      end
    end
    result
  end

  def substring_test(str1, str2)
    str1_substrings = substring(str1)
    # !!str1_substrings.find {|substring| str2.downcase.include?(substring.downcase)}
    str1_substrings.each do |substring|
      return true if str2.downcase.include?(substring.downcase)
    end
    false
  end

  def test_one
    refute(substring_test('Something', 'Fun'))  
  end
  
  def test_two
    assert(substring_test('Something', 'Home'))  
  end
  
  def test_three
    refute(substring_test('Something', ''))  
  end
  
  def test_four
    refute(substring_test('', 'Something'))  
  end
    
  def test_four
    refute(substring_test('', ''))  
  end

  def test_five
    assert(substring_test('BANANA', 'banana'))
  end

  def test_six
    refute(substring_test('test', 'lllt'))
  end

  def test_seven
    refute(substring_test('', ''))
  end

  def test_eight
    assert(substring_test('1234567', '541265'))
  end

  def test_nine
    assert(substring_test('supercalifragilisticexpialidocious', 'SoundOfItIsAtrociou'))
  end
  
end