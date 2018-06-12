require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class SixthExercise < Minitest::Test

  def minilang(str)
  end

  def test_0
    register = minilang('PRINT')
    assert_equal(0, register)      
  end
  
end