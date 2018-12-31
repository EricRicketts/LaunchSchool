require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
Minitest::Reporters.use!

class Exercise1Test < Minitest::Test
  attr_accessor :factorial, :expected

  def setup
    @expected = [1, 1, 2, 6, 24, 120, 720]
    @factorial = Enumerator.new do |yielder|
      n = 0
      product = 1
      loop do
        yielder << product = n.zero? ? 1 : n * product
        n += 1
      end
    end
  end

  def test_first_seven_factorials
    assert_equal(expected, factorial.first(7))
  end

  def test_first_seven_factorials_using_enumerator
    result = []
    factorial.each.with_index do |n_fact, index|
      result << n_fact
      break if index >= 6
    end
    assert_equal(expected, result)
  end
end
