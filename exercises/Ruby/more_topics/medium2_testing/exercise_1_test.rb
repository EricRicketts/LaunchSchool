require 'minitest/autorun'
require 'minitest/reporters'
require_relative './cash_register'
require_relative './transaction'
Minitest::Reporters.use!

class Exercise1Test < Minitest::Test

  def test_one
    assert(true, "test ran import successful")
  end
end
