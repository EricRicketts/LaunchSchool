require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

=begin
Letter Swap

Given a string of words separated by spaces, write a method that takes this string of words and
returns a string in which the first and last letters of every word is swapped.

You may assume that every word contains at least one letter, and that the string will always
contain at least one word. You may also assume that each string contains nothing but words and spaces

Examples:

swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Input: string consisting of letters and spaces, where each word is at least one letter
and spaces separate the words
Output: String is echoed with first and last letter of each word juxtaposed

Algorithm:
  - split on \s+
  - map each word
    - if one letter do nothing
    - if two or more letters return x[-1] + x[1..-2] + x[0]
=end

=begin
Note I went to irb and tried this on x = 'ab'
obviously x[0] = 'a' and x[-1] = 'b' but what
about x[1..-2] in this case?  As x[1] = 'b' but
x[-2] = 'a' so Ruby returned an empty string, '' why?
this happens because passing a string calling #[]
with a range tells Ruby its beginning and end are
interpreted as offsets delimiting the substring to be returned.
However, 'ba' is not a valid substring within 'ab' the only
valid substrings of 'ab' are 'a' and 'ab' not 'ba' so Ruby
returns an empty string
=end
  
  def swap(sentence)
    sentence.split(/\s+/).map do |word| 
      word.length >= 2 ? (word[-1] + word[1..-2] + word[0]) : word
    end.join(" ")
  end

  def test_1
    assert_equal('hO thaw a londerfuw yad ti si', swap('Oh what a wonderful day it is'))      
  end
  
  def test_2
    assert_equal('ebcdA', swap('Abcde'))      
  end
  
  def test_3
    assert_equal('a', swap('a'))     
  end
  
end

class FourthExerciseLS < Minitest::Test

=begin
This is the official LS solution, this is much better I could
not see this solution because I did not think of the effect of
swapping first and last character in the string but that does
modify the string because it works just like modifying an array
in this case.  You MUST return word at the end of the #map otherwise
the answer will be a string with a space in between each character

lets take an example, say we have the string x = 'abc def ghi'
if we run x.split.map {|word| word[0], word[-1] = word[-1], word[0]}.join(' ')
output is: "c a f d i g", why?  This is because the swap above returns an
array of two characters whether the swap object is a string or an array, 
so in 'abc' the return is ['c', 'a'] for 'def' the return is ['f', 'd'] and
finally for 'ghi' the return is ['i', 'g'].  So if we join all of these
arrays with a space we get 'c a f d i g'.  Note that #join flattens an
array before the join
=end
  def swap(sentence)
    sentence.split(/\s+/).map do |word| 
      word[0], word[-1] = word[-1], word[0]
      word
    end.join(" ")
  end

  def test_1
    assert_equal('hO thaw a londerfuw yad ti si', swap('Oh what a wonderful day it is'))      
  end
  
  def test_2
    assert_equal('ebcdA', swap('Abcde'))      
  end
  
  def test_3
    assert_equal('a', swap('a'))     
  end
  
end


