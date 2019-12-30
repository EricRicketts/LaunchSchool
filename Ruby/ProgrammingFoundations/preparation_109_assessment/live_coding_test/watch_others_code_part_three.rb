require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WatchOthersCodePartThreeFirstProblemMySolution < Minitest::Test

=begin
write a method that converts english sentences into a math
expression

AL:
  - assume single digit numbers
  - assume plus, minus, times, divided by
  - we can have an actual digit
  - split and parse
    - first and third are numbers
    - if any of the numbers are not written numbers then we know
      it is a string representation of an actual integer
    - convert each of the numbers to an integer
    - second is the operation
    - use a case statement to perform the operation
=end

  ENGLISH_TO_NUMBER = {
    "zero" => "0", "one" => "1", "two" => "2", "three" => "3", "four" => "4",
    "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"
  }

  MATH_SYMBOLS = {
    "plus" => "+", "minus" => "-",
    "times" => "*", "divided by" => "/"
  }

  def computer(phrase)
    phrase = conv_to_math(phrase)
    compute_div_or_times(phrase) if phrase.split.any? { |str| ["/", "*"].include?(str) }
    phrase.split.none? { |str| ["+", "-"].include?(str) } ? phrase.to_i : compute_plus_or_minus(phrase)
  end

  def compute_plus_or_minus(phrase)
    op = ''
    words = phrase.split
    first_number = words.first.to_i
    words[1..-1].inject(first_number) do |result, word|
      if ["+", "-"].include?(word)
        op = word
        result
      else
        op == "+" ? (result += word.to_i) : (result -= word.to_i)
      end
    end
  end

  def compute_div_or_times(phrase)
    until phrase.split.none? { |str| str.match?(/\/|\*/) }
      phrase.sub!(/(\w+)\s+(\/|\*)\s+(\w+)/) do
        $2 == "*" ? ($1.to_i * $3.to_i).to_s : ($1.to_i / $3.to_i).to_s
      end
    end
  end

  def conv_to_digit_str(number)
    ENGLISH_TO_NUMBER.keys.include?(number) ? ENGLISH_TO_NUMBER[number] : number
  end

  def conv_to_math(phrase)
    phrase.gsub(/\b(plus|minus|times|divided by|\w+)\b/) do
      MATH_SYMBOLS.keys.include?($1) ? MATH_SYMBOLS[$1] : conv_to_digit_str($1)
    end
  end

  def test_1
    # skip
    expected = "2 + 4 - 3"
    assert_equal(expected, conv_to_math("two plus four minus three"))
  end

  def test_2
    # skip
    expected = "16 - 12"
    assert_equal(expected, conv_to_math("16 minus 12"))
  end

  def test_3
    # skip
    expected = "3 - 1 + 5 - 4 + 6 + 10 - 4"
    assert_equal(expected, conv_to_math("three minus one plus five minus 4 plus six plus 10 minus 4"))
  end

  def test_4
    # skip
    expected = "4 * 3 / 9 * 2"
    assert_equal(expected, conv_to_math("four times three divided by nine times two"))
  end

  def test_5
    # skip
    assert_equal(15, compute_plus_or_minus("3 - 1 + 5 - 4 + 6 + 10 - 4"))
  end

  def test_6
    # skip
    phrase = "9 / 3 * 10 / 15"
    compute_div_or_times(phrase)
    assert_equal("2", phrase)
  end

  def test_7
    # skip
    phrase = "9 / 3 + 5 * 4 / 2 - 8"
    compute_div_or_times(phrase)
    assert_equal("3 + 10 - 8", phrase)
  end

  def test_8
    # skip
    phrase = "5 + 9 / 3 * 5 + 15 + 10 / 5 * 4 - 2 / 2 - 8"
    compute_div_or_times(phrase)
    assert_equal("5 + 15 + 15 + 8 - 1 - 8", phrase)
  end

  def test_9
    # skip
    assert_equal(15, computer("three times five"))
  end

  def test_10
    # skip
    assert_equal(7, computer("one plus four times two minus two"))
  end

  def test_11
    # skip
    assert_equal(18, computer("nine divided by three times six"))
  end

  def test_12
    # skip
    assert_equal(9, computer("seven plus four divided by two"))
  end

  def test_13
    # skip
    assert_equal(26, computer("seven times four plus one divided by three minus two"))
  end

  def test_14
    # skip
    assert_equal(5, computer("one plus four times three divided by two minus two"))
  end

  def test_15
    # skip
    assert_equal(18, computer("nine divided by three times six"))
  end

  def test_16
    # skip
    assert_equal(33, computer("eight times four plus six divided by two minus two"))
  end

end
