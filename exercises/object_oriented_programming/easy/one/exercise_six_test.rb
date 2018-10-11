require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseSixTest < Minitest::Test
  class Flight
    attr_accessor :database_handle

    def initialize(flight_number)
      @database_handle = "Database.init"
      @flight_number = flight_number
    end
  end
  # the problem with this class is that there is no way to access
  # the instance variable @flight_number, if it needs to be stored
  # in a database we cannot access it.  I am assuming we do not
  # need to change the flight number for a given flight, otherwise
  # we would need a setter.

  def test_one
    flight = Flight.new(2404)
    assert_raises(NoMethodError) { flight.flight_number }
  end
end

=begin
Launch School Solution:

Hint: Consider what might happen if you leave this class defined as it is,
and later decide to alter the implementation so that a database is not used.

Solution
Delete the following line:

attr_accessor :database_handle

Discussion

The problem with this definition is that we are providing easy access to the
@database_handle instance variable, which is almost certainly just an implementation
detail. As an implementation detail, users of this class should have no need for it,
so we should not be providing direct access to it.

The fix is easy: don't provide the unneeded and unwanted attr_accessor.

What can go wrong if we don't change things? First off, by making access to @database_handle
easy, someone may use it in real code. And once that database handle is being used in real
code, future modifications to the class may break that code. You may even be prevented from
modifying your class at all if the dependent code is of greater concern.

Note my answer was incorrect because the @flight_number instance variable is available to any
object, we can modify the code in the future to provide access to it.  The database issue was
important, having direct access to the database handler could cause unwanted changes to the
database in the future.  It should be passed in as a method argument.

=end