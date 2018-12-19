require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise1Test < Minitest::Test

  def test_failed_boolean_general_case
    refute(4.odd?, 'value is not odd')
  end

  def test_failed_boolean_specific_case
    refute_equal(true, 4.odd?, 'value is not odd')
  end

  def test_failed_boolean_with_assert
    assert(!4.odd?, 'value is not odd')
  end

  def test_failed_boolean_with_assert_equal
    assert_equal(false, 4.odd?, 'value is not odd')
  end

  def test_failed_boolean_with_assert_equal_nil
    refute_equal(nil, 4.odd?, 'value is not odd')
  end
end