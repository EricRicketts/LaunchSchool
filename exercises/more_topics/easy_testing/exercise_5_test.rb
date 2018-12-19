require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise5Test < Minitest::Test
  attr_accessor :list, :str

  def setup
    @list = %w(abc def ghi)
    @str = 'xyz'
  end

  def test_with_assert_include
    # this test will fail
    skip
    assert_includes(list, str)
  end

  def test_with_assert
    # this test will fail
    skip
    assert(list.include?(str), "list containts 'xyz'")
  end

  def test_with_assert_equal
    # this test will fail
    skip
    assert_equal(true, list.include?(str))
  end

  def test_with_refute_includes
    refute_includes(list, str)
  end

  def test_with_refute
    refute(list.include?(str), "list does not contain 'xyz'")
  end

  def test_with_refute_equal
    refute_equal(true, list.include?(str))
  end
end