require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise6Test < Minitest::Test

  def convert_to_base_8(n)
    arr_of_digits = Array.new
    quotient, remainder = n.divmod(8)
    if quotient > 8
      convert_to_base_8(quotient).concat(remainder.to_s)
    else
      "#{quotient.to_s + remainder.to_s}"
    end
  end

  def test_base_8
    foo = convert_to_base_8(1000)
    binding.pry
  end
end
