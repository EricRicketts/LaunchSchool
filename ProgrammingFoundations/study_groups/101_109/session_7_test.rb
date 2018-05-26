# Given an array of numbers find if any 3 numbers inside of the array
#   can be multiplied to get the maximum number in the array.
#   If the number is used once it can't be used again. If there are two same numbers
#   then that number can be used 2 times.

# p mult_of_three_nums([1,2,3,4,5,6]) == true
# p mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]) == false
# p mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]) == true
# p mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]) == true
# p mult_of_three_nums([2, 5, 8, 11, 32, 2]) == true
# p mult_of_three_nums([13, 3, 11, 56, 79, 2]) == false

# def mult_of_three_nums(arr)
#   subarr = []
#   max = arr.max
#   0.upto(arr.length - 3) do |first_num|
#     1.upto(arr.length - 2) do |second_num|
#       2.upto(arr.length - 1) do |third_num|
#         return true if ((arr[first_num] * arr[second_num] *   arr[third_num] == max) && (third_num > second_num) && (second_num > first_num))
#       end
#     end
#   end
#   return false
# end

=begin

Write function scramble(str1,str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise returns false.
Only lower case letters will be used (a-z). No punctuation or digits will be included.

scramble('rkqodlw','world') == true
scramble('cedewaraaossoqqyt','codewars') == true
scramble('katas','steak') == false
scramble('scriptjava','javascript') == true
scramble('scriptingjava','javascripts') == false

AL:
  - so string 2 has to appear in string 1 as a substring
  - for each letter in string 2, remove the letter from string 1
  - use this letter to build a new string
  - when this new string == string 2 return true
  - if the loop exits with no match return false
=end

=begin
Given a string, find the number character that is repeated most times and return it's numeric value.
If multiple characters are repeated the same time, return first one.
If there are no numeric characters in a string return nil.

AL
  - convert string to a char
  - initialize a hash to []
  - for each char in the array of chars
    - if the char is a digit increase the hash value
      - if the first time, record the array index
    - skip if the char is not a digit
  
p re_letter('There isn\' any number here!') == nil
p re_letter('%^&*()!') == nil
p re_letter('111222333') == 1
p re_letter('1234335521444') == 4
p re_letter('') == nil
p re_letter('011-555-333-23') == 3 
p re_letter('1') == 1 
p re_letter('444352893599119') == 9
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Session7TestFirstProblem < Minitest::Test

  def mult_of_three_nums(array)
    max_number = array.max
    combinantions = array.permutation(3).to_a
    !!combinantions.find {|ary| ary.reduce(:*) == max_number}
  end

  def test_1
    # skip
    assert(mult_of_three_nums((1..6).to_a))
  end
  
  def test_2
    # skip
    refute(mult_of_three_nums([3, 8, 0, 9, 4, 2, 7]))
  end

  def test_3
    # skip
    assert(mult_of_three_nums([5, 3, 7, 9, 2, 51, 90]))
  end
    
  def test_4
    # skip
    assert(mult_of_three_nums([1, 1, 5, 7, 987, 3, 2]))
  end
  
  def test_5
    # skip
    assert(mult_of_three_nums([2, 5, 8, 11, 32, 2]))
  end
  
  def test_6
    # skip
    refute(mult_of_three_nums([13, 3, 11, 56, 79, 2]))
  end
  
end

class Session7TestSecondProblem < Minitest::Test

  def scramble(str1, str2)
    str1_array = str1.chars
    substring = str2.chars.inject('') do |string, letter|
        idx = str1_array.index(letter)
        string += str1_array.delete_at(idx) if str1_array.include?(letter)
        string
    end
    substring == str2
  end

  def test_1
    # skip
    assert(scramble('rkqodlw','world'))
  end

  def test_2
    # skip
    assert(scramble('cedewaraaossoqqyt','codewars'))
  end

  def test_3
    # skip
    refute(scramble('katas','steak'))
  end

  def test_4
    # skip
    assert(scramble('scriptjava','javascript'))
  end

  def test_5
    # skip
    refute(scramble('scriptingjava','javascripts'))
  end

  def test_6
    # skip
    refute(scramble('abceflxyztghlte','telltale'))
  end

  def test_7
    # skip
    assert(scramble('abcleflxyztghlte','telltale'))
  end

end

class Session7TestThirdProblem < Minitest::Test

  def re_letter(string)
    return nil if string.empty? || string.chars.none? {|char| char.match?(/[[:digit:]]/)}
    hsh = Hash.new {|hash, key| hash[key] = [0, 0]}
    string.chars.each.with_index do |char, idx|
      if char.match?(/[[:digit:]]/)
        if hsh[char] == [0, 0]
          hsh[char][0] += 1
          hsh[char][1] = idx
        else
          hsh[char][0] += 1
        end
      end
    end
    sorted_ary = hsh.sort_by {|k, v| v.first}.reverse
    max_occurances = sorted_ary.first.last.first
    selected_maxes = sorted_ary.select {|ary| ary.last.first == max_occurances}
    sort_by_first_appearance = selected_maxes.sort_by {|ary| ary.last.last}
    sort_by_first_appearance.first.first.to_i
  end

  def test_1
    # skip
    assert_nil(re_letter('There isn\' any number here!'))
  end

  def test_2
    # skip
    assert_nil(re_letter('%^&*()!'))
  end

  def test_3
    # skip
    assert_equal(1, re_letter('111222333'))
  end
 
  def test_4
    # skip
    assert_equal(4, re_letter('1234335521444'))
  end
 
  def test_5
    # skip
    assert_nil(re_letter(''))
  end
 
  def test_6
    # skip
    assert_equal(3, re_letter('011-555-333-23'))
  end
 
  def test_7
    # skip
    assert_equal(1, re_letter('1'))
  end
 
  def test_8
    # skip
    assert_equal(9, re_letter('444352893599119'))
  end
 
  def test_9
    # skip
    assert_equal(4, re_letter('3524894359914194'))
  end
 
end