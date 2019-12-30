require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

=begin
Scrabble Score:

Write a program that, given a word, computes the scrabble score for that word.

Letter Values:

Letter                               Value
A, E, I, O, U, L, N, R, S, T           1
D, G                                   2
B, C, M, P                             3
F, H, V, W, Y                          4
K                                      5
J, X                                   8
Q, Z                                   10

Understanding the problem:

- Input: a string
  - lower case / upper case?
- Output: an integer (the scrabble score)
- Rules:
  - the score is the sum of scores of each letter in the string
  - the letter value table is used to look up the letter scores
  
- Examples / Test Cases:

score('a')        => 1
score('cabbage')  => 14
score('Cabbage')  => 14
=end

class ScrabbleScoreTest < Minitest::Test

  def score(word)
    letter_values = {
      'a' => 1, 'e' => 1, 'i' => 1, 'o' => 1, 'u' => 1, 'l' => 1,
      'n' => 1, 'r' => 1, 's' => 1, 't' => 1, 'd' => 2, 'g' => 2,
      'b' => 3, 'c' => 3, 'm' => 3, 'p' => 3, 'f' => 4, 'h' => 4,
      'v' => 4, 'w' => 4, 'y' => 4, 'k' => 5, 'j' => 8, 'x' => 8,
      'q' => 10, 'z' => 10
    }
    word.downcase.chars.inject(0) { |score, letter| score += letter_values[letter] }    
  end

  def test_first_scrabble_score
    assert_equal(1, score('a'))    
  end

  def test_second_scrabble_score
    assert_equal(14, score('cabbage'))
  end

  def test_third_scrabble_score
    assert_equal(14, score('Cabbage'))
  end
  
end