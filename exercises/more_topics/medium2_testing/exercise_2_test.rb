require 'minitest/autorun'
require 'minitest/reporters'
require_relative './cash_register'
require_relative './transaction'
Minitest::Reporters.use!

class Exercise1Test < Minitest::Test
  attr_accessor :register, :transaction

  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(100)
  end

  def test_one
    expected = [CashRegister, Transaction]
    result = [register.class, transaction.class]
    assert_equal(expected, result)
  end
end
