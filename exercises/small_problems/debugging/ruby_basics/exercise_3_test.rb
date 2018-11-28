require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class Exercise3Test < Minitest::Test
  attr_accessor :io

  def multiply_by_five(n)
    n*5
  end

  def setup
    @io = StringIO.new("10\n")
  end

  def test_one
    # it does not give us the expected output because
    # the local parameter n in #multiply_by_five has
    # not been converted to an integer.  So instead
    # we have string multiplication
    out, err = capture_io do
      num = io.gets.chomp
      puts "The result is #{multiply_by_five(num)}."
    end
    assert_equal("The result is 1010101010.\n", out)
  end

  def test_two
    out, err = capture_io do
      num = io.gets.chomp.to_i
      puts "The result is #{multiply_by_five(num)}."
    end
    assert_equal("The result is 50.\n", out)
  end

end
