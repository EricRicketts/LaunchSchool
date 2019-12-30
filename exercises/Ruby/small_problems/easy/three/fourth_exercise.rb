require 'minitest/autorun'
require 'minitest/pride'
require 'byebug'

class FourthExercise < Minitest::Test

  def multiply(n1, n2)
    n1 * n2
  end

  def test_one
    assert(12, multiply(4, 3))
  end
  
end