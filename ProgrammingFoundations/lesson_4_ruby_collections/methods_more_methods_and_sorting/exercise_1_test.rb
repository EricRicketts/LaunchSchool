require 'minitest/autorun'
require 'minitest/pride'

class Exercise1Test < Minitest::Test
  def test_select
    result = [1, 2, 3].select do |num|
      num > 5
      'hi' # always returns true because 'hi' is truthy
    end
    assert_equal [1, 2, 3], result
  end
end