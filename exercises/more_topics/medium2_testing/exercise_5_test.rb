require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
require_relative './cash_register'
require_relative './transaction'
Minitest::Reporters.use!

class Exercise5Test < Minitest::Test
  attr_accessor :register, :transaction

  def setup
    @register = CashRegister.new(100.00)
    @transaction = Transaction.new(25.00)
  end

  def test_give_receipt
    expected = "You've paid $25.0.\n"
    assert_output(expected) do
      register.give_receipt(transaction)
    end
  end
end