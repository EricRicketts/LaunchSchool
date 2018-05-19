

# Write a function called that takes a string of parentheses,
#  and determines if the order of the parentheses is valid.
#   The function should return true if the string is valid,
#    and false if it's invalid.


# p valid_parentheses( "()" ) == true
# p valid_parentheses( "())" ) == false

# "()"              =>  true
# ")(()))"          =>  false
# "("               =>  false
# "(())((()())())"  =>  true

=begin
take "()((()())())"
expand it "() ( ( () () ) () )"

  "(", "(", ")", ""
AL
  - if number of characters is odd then false
  - if the first character is a "(" then false
  - note take this example: "(())((()())())"
  - there are 14 characters, but 7 pairs of matched "()"
  - have two loops outer loop will iterate over the number of pairs
  which is 1/2 the number of charactes
    while count < 1/2 number of characters
      - inner loop
        - set idx = 0
        - if current char == "(" and next char == ")"
          delete the two characters in the array
          break out of inner loop
          else
            advance idx
            but if the idx >= length of array break out of inner loop
            (you have reached the end of the array)


As Srdjan noted I overthought the problem, the algorithm was too complicated
see his much simpler solution below, note the algorithm development
=end

require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class Session5Test < Minitest::Test

  def valid_parentheses(str)
    par_ary = str.chars
    number_parens = par_ary.length
    return false if str.count("(") != str.count(")")

    count = 0
    iterations = number_parens / 2
    while count < iterations
      idx = 0
      loop do
        if par_ary[idx] == "(" && par_ary[idx + 1] == ")"
          2.times { par_ary.delete_at(idx) }
          break
        else
          idx += 1
          break if idx >= par_ary.length - 1
        end
      end
      count += 1
    end
    par_ary.empty?
  end

  def test_1
    # skip
    assert(valid_parentheses("()"))
  end
  
  def test_2
    # skip
    refute(valid_parentheses("())"))
  end
  
  def test_3
    # skip
    assert(valid_parentheses("()()"))
  end

  def test_4
    # skip
    assert(valid_parentheses("()(())"))
  end

  def test_5
    # skip
    refute(valid_parentheses("()())("))
  end

  def test_6
    # skip
    assert(valid_parentheses("(())((()())())"))
  end
  
  def test_7
    # skip
    assert(valid_parentheses("(((())))"))
  end

  def test_8
    # skip
    refute(valid_parentheses("(()))()("))
  end

  def test_9
    # skip
    refute(valid_parentheses(")())"))
  end

  def test_10
    # skip
    refute(valid_parentheses("()))))()(((()"))
  end

end

class Session5TestSrdjan < Minitest::Test

=begin
  Let us look at this from another point of view, take
  the follwing set of parentheses "()((())())" break this
  up into a array of chars ["(", ")", "(", "(", "(", ")", ")", "(", ")", ")"]
    - we note that for it to be valid, all opening "(" must have a closing
    ")" counterpart
    - furthermore as we traverse the array of parentheses we can start counting
     -traversing char by char
      - open = 1
      - open = 1, close = 2
      - open = 2, close = 1
      - open = 3, close = 1
      - open = 4, close = 1
      - open = 4, close = 2
      - open = 4, close = 3
      - open = 5, close = 3
      - open = 5, close = 4
      - open = 5, close = 5

    - since we always have to start with open "(" we can be guaranteed as we
    traverse the array that open >= close or open - close >= 0 we cannot have
    open - close < 0

=end

  def valid_parentheses(str)
    open = 0
    str.chars.each do |paren|
      paren == "(" ? open += 1 : open -= 1
      return false if open < 0
    end
    open.zero?
  end

  def test_1
    # skip
    assert(valid_parentheses("()"))
  end
  
  def test_2
    # skip
    refute(valid_parentheses("())"))
  end
  
  def test_3
    # skip
    assert(valid_parentheses("()()"))
  end

  def test_4
    # skip
    assert(valid_parentheses("()(())"))
  end

  def test_5
    # skip
    refute(valid_parentheses("()())("))
  end

  def test_6
    # skip
    assert(valid_parentheses("(())((()())())"))
  end
  
  def test_7
    # skip
    assert(valid_parentheses("(((())))"))
  end

  def test_8
    # skip
    refute(valid_parentheses("(()))()("))
  end

  def test_9
    # skip
    refute(valid_parentheses(")())"))
  end

  def test_10
    # skip
    refute(valid_parentheses("()))))()(((()"))
  end
  
end