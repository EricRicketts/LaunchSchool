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
    # passes because Integer < Numeric
    assert_kind_of(Numeric, int)
  end

  def test_with_float
    # passes becaue Float < Numeric
    assert_kind_of(Numeric, float)
  end

  def test_refute_with_integer
    refute_kind_of(Float, int)
  end

  def test_refute_with_float
    refute_kind_of(Integer, float)
  end
end