require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WatchOthersCodePartTwoFirstProblemMySolution < Minitest::Test

=begin
write a method that will return a substring based on specified indices
AL:
  - make method parameters (str, *indices)
  - if indices.length == 1
    - string first_idx
  - else
    - string first_idx..second_idx
=end

  def substring(str, *indices)
    indices.length == 1 ? str[indices.first] : str[indices.first..indices[1]]
  end

  def test_1
    # skip
    assert_equal("hon", substring("honey", 0, 2))
  end

  def test_2
    # skip
    assert_equal("on", substring("honey", 1, 2))
  end

  def test_3
    # skip
    assert_equal("ey", substring("honey", 3, 9))
  end

  def test_4
    # skip
    assert_equal("n", substring("honey", 2))
  end

end

class WatchOthersCodePartTwoSecondProblemMySolution < Minitest::Test

=begin
write a method that finds all substrings in a string with each
substring at least two characters, ie no one letter words

AL:
  - assume string is at least two characters
  - make an empty array
  - 0.upto(last_idx - 1)
    - idx to last_idx unless idx >= last_idx - 2
=end

  def substrings(str)
    substrs = []
    last_idx = str.size - 1
    0.upto(last_idx - 1) do |idx|
      idx.upto(last_idx) do |index|
        unless index > last_idx - 1
          substrs.push(str[idx..index + 1])
        end
      end
    end
    substrs
  end

  def substring(str, *indices)
    indices.length == 1 ? str[indices.first] : str[indices.first..indices[1]]
  end

  def test_1
    # skip
    expected = %w(ba ban band an and nd)
    assert_equal(expected, substrings("band"))
  end

  def test_2
    # skip
    expected = %w(wo wor worl world or orl orld rl rld ld)
    assert_equal(expected, substrings("world"))
  end

  def test_3
    # skip
    expected = %w(pp ppo ppop po pop op)
    assert_equal(expected, substrings("ppop"))
  end

  def test_4
    # skip
    expected = %w(up)
    assert_equal(expected, substrings("up"))
  end

end

class WatchOthersCodePartTwoThirdProblemMySolution < Minitest::Test

=begin
write a method that will return all substrings that are palindromes
within a string
=end

  def palindromes(str)
    substrings(str).select { |substr| substr == substr.reverse }
  end

  def substrings(str)
    substrs = []
    last_idx = str.size - 1
    0.upto(last_idx - 1) do |idx|
      idx.upto(last_idx) do |index|
        unless index > last_idx - 1
          substrs.push(str[idx..index + 1])
        end
      end
    end
    substrs
  end

  def substring(str, *indices)
    indices.length == 1 ? str[indices.first] : str[indices.first..indices[1]]
  end

  def test_1
    # skip
    expected = %w(pp pop)
    assert_equal(expected, palindromes("ppop"))
  end

  def test_2
    # skip
    expected = %w(alula lul)
    assert_equal(expected, palindromes("alula"))
  end

end

class WatchOthersCodePartTwoFourthProblemMySolution < Minitest::Test

=begin
write a method that will find the largest substring that is a palindrome
within a string
=end

  def largest_palindrome(str)
    palindromes(str).sort_by { |substr| substr.size }.last
  end

  def palindromes(str)
    substrings(str).select { |substr| substr == substr.reverse }
  end

  def substrings(str)
    substrs = []
    last_idx = str.size - 1
    0.upto(last_idx - 1) do |idx|
      idx.upto(last_idx) do |index|
        unless index > last_idx - 1
          substrs.push(str[idx..index + 1])
        end
      end
    end
    substrs
  end

  def substring(str, *indices)
    indices.length == 1 ? str[indices.first] : str[indices.first..indices[1]]
  end

  def test_1
    # skip
    assert_equal("pop", largest_palindrome("ppop"))
  end

  def test_2
    # skip
    assert_equal("alula", largest_palindrome("aalulala"))
  end

end
