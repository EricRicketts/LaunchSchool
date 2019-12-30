require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class WatchOthersCodePartFourProblemOneMySolution < Minitest::Test

=begin
write a method that takes a single string argument and retunns a new
string that contains the original value of the argument, but the first
letter of every word is now capitalized.

You may assume that words are any sequence of non-blank characters,
and that only the first character of each word must be considered.

AL:
  - split on spaces, which is default
  - if string begins with a letter then upcase that letter
  - if string does not begin with a letter then leave it alone
  - then join back into a string
=end

  def word_cap(str)
    words = str.split
    lower_case_letters = /[a-z]/
    words.map do |word|
      word.start_with?(lower_case_letters) ? (word[0].upcase + word[1..-1]) : word
    end.join(' ')
  end

  def test_1
    # skip
    string = "four score and seven"
    expected = "Four Score And Seven"
    assert_equal(expected, word_cap(string))
  end

  def test_2
    # skip
    string = "the javaScript language"
    expected = "The JavaScript Language"
    assert_equal(expected, word_cap(string))
  end

  def test_3
    # skip
    string = 'this is a "quoted" word'
    expected = "This Is A \"quoted\" Word"
    assert_equal(expected, word_cap(string))
  end

end

class WatchOthersCodePartFourProblemOneRegex < Minitest::Test

=begin
write a method that takes a single string argument and retunns a new
string that contains the original value of the argument, but the first
letter of every word is now capitalized.

You may assume that words are any sequence of non-blank characters,
and that only the first character of each word must be considered.

AL:
  - split on spaces, which is default
  - if string begins with a letter then upcase that letter
  - if string does not begin with a letter then leave it alone
  - then join back into a string
=end

  def word_cap(str)
    str.gsub(/\b(?<!")\w+\b/) { |s| s[0].upcase + s[1..-1] }
  end

  def test_1
    # skip
    string = "four score and seven"
    expected = "Four Score And Seven"
    assert_equal(expected, word_cap(string))
  end

  def test_2
    # skip
    string = "the javaScript language"
    expected = "The JavaScript Language"
    assert_equal(expected, word_cap(string))
  end

  def test_3
    # skip
    string = 'this is a "quoted" word'
    expected = "This Is A \"quoted\" Word"
    assert_equal(expected, word_cap(string))
  end

end

class WatchOthersCodePartFourProblemTwoMySolution < Minitest::Test

=begin
Write a method that returns the number of Friday the 13ths for the
year passed in.  You may assume the year is greater than 1752 (when
the modern Gregorian Calendar was adopted by the United Kingdom).  You
may assume that the same calendar will remain for the forseeable future.

AL:
  - Time class takes the format year-month-day_of_month
  - so I can have an array of numbers one to 12
    - cycle through each month
    - the day of the month will be constant - 13th
    - then make the selection if the 13th of that month is a Friday
=end

  def friday_13th?(year)
    start_month, end_month = 1, 12
    day_of_month = 13
    (start_month..end_month).select do |month|
      Time.new(year, month, day_of_month).friday?
    end.count
  end

  def test_1
    # skip
    assert_equal(3, friday_13th?(2015))
  end

  def test_2
    # skip
    assert_equal(1, friday_13th?(1986))
  end

end

class WatchOthersCodePartFourProblemThreeMySolution < Minitest::Test

=begin
Write a method that will generate random english math problems.  The method
should take a length, then return the math phrase with that many operations

mathphrase(1) = "five minues two"
mathphrase(2) = "two plus three times eight"
mathphrase(3) = "one divided by three plus five times zero"

AL:
  - start with an empty string
  - use 1.upto(number)
    - add to the end of the string with each operation
    - if it is the first operation we need two numbers, one on each side of the operator
      - if the operation is a divide we must not divide by zero
    - if the operation is > first operation
      - we nust need operator and a number but if divide we cannot have zero

  - make four methods to call
    - first divide method
    - first non divide method
    - divide method
    - non divide method
=end

NUMBERS = %W(zero one two three four five six seven eight nine)
OPERATORS = %W(plus minus times divided\sby)

  def mathphrase(number_of_ops)
    op_size = OPERATORS.size
    phrase = ''
    1.upto(number_of_ops) do |n|
      op = OPERATORS[rand(op_size)]
      case n
      when 1 then phrase += first_phrase(op)
      else phrase += default_phrase(op)
      end
    end
    phrase
  end

  def default_phrase(op)
    case op
    when "divided by" then make_div_phrase
    else make_phrase(op)
    end
  end

  def first_phrase(op)
    case op
    when "divided by" then make_first_div_phrase
    else make_first_phrase(op)
    end
  end

  def make_div_phrase
    divide_index = OPERATORS.size - 1
    op = OPERATORS[divide_index]

    valid_numbers = NUMBERS[1..-1]
    max_num_size = valid_numbers.size

    number = valid_numbers[rand(max_num_size)]

    "\s" + op + "\s" + number
  end

  def make_first_div_phrase
    valid_numbers = NUMBERS[1..-1]
    max_num_size = valid_numbers.size

    first_number = NUMBERS[rand(NUMBERS.size)]
    second_number = valid_numbers[rand(max_num_size)]

    divide_index = OPERATORS.size - 1
    op = OPERATORS[divide_index]
    first_number + "\s" + op + "\s" + second_number
  end

  def make_first_phrase(op)
    first_number, second_number = NUMBERS[rand(NUMBERS.size)], NUMBERS[rand(NUMBERS.size)]

    first_number + "\s" + op + "\s" + second_number
  end

  def make_phrase(op)
    number = NUMBERS[rand(NUMBERS.size)]

    "\s" + op + "\s" + number
  end

  def test_1
    # skip
    phrase = make_first_div_phrase
    words = phrase.split
    assert(NUMBERS.include?(words.first))
    assert((words[1] + "\s" + words[2]) == "divided by")
    assert(NUMBERS[1..-1].include?(words.last))
  end

  def test_2
    # skip
    phrases = []
    20.times { phrases.push(make_first_div_phrase) }
    last_numbers = phrases.map { |phrase| phrase.split.last }
    assert(last_numbers.none? { |number| number == "zero"} )
  end

  def test_3
    # skip
    phrase = make_first_phrase("plus")
    words = phrase.split
    assert(NUMBERS.include?(words.first) && words[1] == "plus" && NUMBERS.include?(words.last))
  end

  def test_4
    # skip
    phrases = []
    20.times { phrases.push(make_div_phrase) }
    last_numbers = phrases.map { |phrase| phrase.split.last }
    assert(last_numbers.none? { |number| number == "zero"} )
  end

  def test_5
    # skip
    phrase = make_phrase("times")
    words = phrase.split
    assert(words.first == "times" && NUMBERS.include?(words.last))
  end

  def test_6
    # skip
    phrase = mathphrase(1)
    words = phrase.split
    if phrase.match?(/divided/)
      assert(NUMBERS.include?(words.first))
      assert((words[1] + "\s" + words[2]) == "divided by")
      assert(NUMBERS[1..-1].include?(words.last))
    else
      assert(NUMBERS.include?(words.first) && OPERATORS[0..-2].include?(words[1]) && NUMBERS.include?(words.last))
    end
  end

  def test_7
    # skip
    phrase = mathphrase(2)
    words = phrase.split
    if (words[-3] + "\s" + words[-2]) == "divided by"
      refute(words.last == "zero")
    else
      assert(OPERATORS[0..-2].include?(words[-2]) && NUMBERS.include?(words.last))
    end
  end

end
