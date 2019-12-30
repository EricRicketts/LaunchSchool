=begin
Welcome Stranger

Create a method that takes 2 arguments, an array and a hash.
The array will contain 2 or more elements that, when combined
with adjoining spaces, will produce a person's name. The hash
will contain two keys, :title and :occupation, and the appropriate
values. Your method should return a greeting that uses the person's
full name, and mentions the person's title.

Example:

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> Hello, John Q Doe! Nice to have a Master Plumber around.

AL:
  - convert array into a name string via join(' ')
  - "Hell, #{name}!  Nice to have a #{title} #{occupation} around."
=end
require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FirstExercise < Minitest::Test

  def greetings(ary, hsh)
    name = ary.join(' ')
    "Hello, #{name}!  Nice to have a #{hsh[:title]} #{hsh[:occupation]} around."
  end

  def test_0
    # skip
    expected = "Hello, John Q Doe!  Nice to have a Master Plumber around."
    result = greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
    assert_equal(expected, result)
  end
  
end

class FirstExerciseLS < Minitest::Test

  def greetings(name, status) # better parameter names than mine
    name = name.join(' ')
    "Hello, #{name}!  Nice to have a #{status[:title]} "\
      "#{status[:occupation]} around."
  end

  def test_0
    # skip
    expected = "Hello, John Q Doe!  Nice to have a Master Plumber around."
    result = greetings(['John', 'Q', 'Doe'],
      { title: 'Master', occupation: 'Plumber' })
    assert_equal(expected, result)
  end
  
end