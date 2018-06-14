require 'minitest/autorun'
require 'minitest/pride'

# what is the output of this last line of code
class QuestionTwo < Minitest::Test
  def test_hashes
    greetings = { a: 'hi' }
    informal_greeting = greetings[:a]
    informal_greeting << ' there'

    expected = { a: 'hi there' }
    assert_equal 'hi there', informal_greeting
    assert_equal expected, greetings
  end

# this is a very important subject to understand
# with depth.  in line 8 the variable informal_greeting
# is set equal to the value for the hash key :a
# thus both have the same value and object_id
# now the shovel method, <<, modifies the caller,
# so when informal_greeting gets modified, so does
# greetings[:a], to get around this, one could
# update informal_greeting by informal_greeting += ' there'
# which produces a new string and does not modify the caller
end