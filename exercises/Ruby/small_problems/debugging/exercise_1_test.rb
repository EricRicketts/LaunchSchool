require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise1Test < Minitest::Test

  def decrease(counter)
    counter -= 1
  end

  def test_wrong_result
    ary = []
    counter = 10

    10.times do
      ary << counter
      decrease(counter)
    end

    assert_equal(Array.new(10, 10), ary)
  end

  def test_fix
    ary = []
    counter = 10

    10.times do
      ary << counter
      counter = decrease(counter)
    end

    expected = 10.downto(1).entries
    assert_equal(expected, ary)
  end
end