require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement:

Which of the following are objects in Ruby?
If they are objects, how can you find out what class they belong to?

true
"hello"
[1, 2, 3, "happy days"]
142
=end
class QuestionOneTest < Minitest::Test
  def test_1
    # true is an instance of the TrueClass
    assert_equal(TrueClass, true.class)
  end

  def test_2
    # "hello" is an instance of the String Class
    assert_equal(String, "hello".class)
  end

  def test_3
    # [1, 2, 3, "happy days"] is an instance of the Array Class
    assert_equal(Array, [1, 2, 3, "happy days"].class)
  end

  def test_4
    # 142 is an instance of the Integer Class
    assert_equal(Integer, 142.class)
  end
end