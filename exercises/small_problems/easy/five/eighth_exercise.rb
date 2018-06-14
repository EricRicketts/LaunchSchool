require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Alphabetical Numbers

Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Examples:

alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

I: array of numbers 0 to 19
O: array of numbers

AL:
  - make a constant, a hash of words 'zero'..'nineteen' mapping to 0..19
  - for each number in the incoming array select the correct key value from the hash
  
=end


class EighthExercise < Minitest::Test

  NUMBER_WORDS = %W(zero, one, two, three, four, five, six, seven, eight, nine,
    ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen,
    eighteen, nineteen)
  NUMBERS = (0..19).to_a
  WORDS_AND_NUMBERS = NUMBER_WORDS.zip(NUMBERS).to_h

  def alphabetic_number_sort(arr)
    hash_slice = {}
    reversed_words_and_numbers = WORDS_AND_NUMBERS.invert
    arr.each {|number| hash_slice[number] = reversed_words_and_numbers[number]}
    sorted_values = hash_slice.values.sort
    sorted_values.map{|str| WORDS_AND_NUMBERS[str]}
  end

  def test_1
    expected = [8, 11, 15, 5, 14, 9, 7, 6, 10, 13, 12]
    assert_equal(expected, alphabetic_number_sort(5..15).to_a)
  end

  def test_2
    expected = [
      8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
      6, 16, 10, 13, 3, 12, 2, 0
    ]
    assert_equal(expected, alphabetic_number_sort((0..19).to_a))
  end
  
end

class EighthExerciseLS < Minitest::Test

=begin
I did a more general purpose solution where any range between 0 and 19
could be selected.  The problem only asked for 0..19.  I had no idea
of the #sort_by from the Enumerable class
=end

  NUMBER_WORDS = %w(zero one two three four
                    five six seven eight nine
                    ten eleven twelve thirteen fourteen
                    fifteen sixteen seventeen eighteen nineteen)

  def alphabetic_number_sort(numbers)
    numbers.sort_by { |number| NUMBER_WORDS[number] }
  end

  def test_1
    expected = [
      8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
      6, 16, 10, 13, 3, 12, 2, 0
    ]
    assert_equal(expected, alphabetic_number_sort((0..19).to_a))
  end
  
end