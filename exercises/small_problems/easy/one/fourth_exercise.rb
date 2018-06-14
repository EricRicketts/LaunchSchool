require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

=begin
How Many?

Write a method that counts the number of occurrences of each element in a given array.

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']

count_occurrences(vehicles)
Once counted, print each element alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2

Input: array of strings
Output: Hash

Algorithm:

  - initialize an empty hash with 0 value Occurances = Hash.new(0)
  - cycle through each word in the array
    - for each word use it as a key in the occurances hash and increment the value by 1
=end

  def count_occurrences(ary)
    ary.each_with_object(Hash.new(0)) {|word, hsh| hsh[word] += 1}
  end

  def count_occurrences_v2(ary)
    count_hsh = {}
    uniq_ary = ary.uniq
    uniq_ary.each {|word| count_hsh[word] = ary.count(word)} 
    count_hsh 
  end

  def test_count_words
    expected = { 'car' => 4, 'truck' => 3, 'SUV' => 1, 'motorcycle' => 2}
    vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
      'motorcycle', 'car', 'truck']
    assert_equal(expected, count_occurrences(vehicles)) 
  end

  def test_count_words_v2
    expected = { 'car' => 4, 'truck' => 3, 'SUV' => 1, 'motorcycle' => 2}
    vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle',
      'motorcycle', 'car', 'truck']
    assert_equal(expected, count_occurrences_v2(vehicles)) 
  end

end