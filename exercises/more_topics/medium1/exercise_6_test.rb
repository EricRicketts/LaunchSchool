require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise6Test < Minitest::Test
  attr_accessor :input, :expected

  def setup
    @input = [8, 10, 12, 14, 16, 33]
    @expected = [10, 12, 14, 16, 20, 41]
  end

  def convert_to_base_8(n)
    n.to_s(8).to_i
  end

  def convert_to_base(args)
    base, n = args
    quotient, remainder = n.divmod(base)
    if quotient > base
      convert_to_base([base, quotient]).concat(remainder.to_s)
    else
      "#{quotient.to_s + remainder.to_s}"
    end
  end

  def test_ls_base_8
    base_8_proc = method(:convert_to_base_8).to_proc
    result = input.map(&base_8_proc)
    assert_equal(expected, result)
  end

  def test_my_convert_to_base
    base_8_proc = method(:convert_to_base).to_proc
    new_input = Array.new(6, 8).zip(input)
    result = new_input.map(&base_8_proc).map(&:to_i)
    assert_equal(expected, result)
  end
end
