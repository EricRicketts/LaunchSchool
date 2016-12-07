require 'minitest/autorun'
require 'minitest/pride'

class QuestionOne < Minitest::Test
  def test_greeting
    if false
      greeting = "hello world"
    end
    assert_nil greeting
    assert_raises NameError do
      puts x
    end
  end
# in the above case when greeting gets initialized in the
# if block but the block gets skipped over the variable
# initializes to nil.  In the case of the variable x that is
# not initialized anywhere so it throws a NameError exception
end