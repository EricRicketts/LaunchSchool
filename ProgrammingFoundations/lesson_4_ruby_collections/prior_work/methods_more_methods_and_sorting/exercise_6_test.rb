require 'minitest/autorun'
require 'minitest/pride'

class Exercise6Test < Minitest::Test
  def test_pop
    result = ['ant', 'bear', 'caterpillar'].pop.size
    assert_equal 11, result # returns the string 'caterpillar' and calls size on that
  end
end