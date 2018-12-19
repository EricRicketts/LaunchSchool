require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise4Test < Minitest::Test
  attr_accessor :arr

  def setup
    @arr = (1..10).to_a
  end

  def test_with_assert_empty
    # this test will fail
    skip
    assert_empty(arr)
  end

  def test_with_assert_equal
    # this test will fail
    skip
    assert_equal(Array.new, arr)
  end

  def test_with_assert
    # this test will fail
    skip
    assert(arr.empty?, 'array is empty')
  end

  def test_with_refute_empty
    refute_empty(arr)
  end

  def test_with_refute_equal
    refute_equal(Array.new, arr)
  end

  def test_with_refute
    refute(arr.empty?)
  end
end