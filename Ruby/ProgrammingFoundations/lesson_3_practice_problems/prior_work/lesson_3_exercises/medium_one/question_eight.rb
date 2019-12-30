require 'minitest/autorun'
require 'minitest/pride'

# add method to string class
class String
  def titlelize!
    result = split(" ").map(&:capitalize!).join(" ")
    replace(result)
  end
end

# implement your own version of Rails titlelize! in this program
class QuestionEight < Minitest::Test
  def test_titlelize
    expected = "The Flintstones Rock"
    words = "the flintstones rock"
    words.titlelize!

    assert_equal expected, words
  end
end
