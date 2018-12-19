require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise7Test < Minitest::Test
  attr_accessor :int, :float

  def setup
    @int = 4
    @float = 4.0
  end

  def test_with_integer
    # this test will fail
    skip
    assert_instance_of(Numeric, int)
  end

  def test_with_float
    # this test will fail
    skip
    assert_instance_of(Numeric, float)
  end

  def test_refute_with_integer
    refute_instance_of(Numeric, int)
  end

  def test_refute_with_float
    refute_instance_of(Numeric, float)
  end
end