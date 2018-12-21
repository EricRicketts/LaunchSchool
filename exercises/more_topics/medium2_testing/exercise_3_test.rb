require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
require 'stringio'
require_relative './cash_register'
require_relative './transaction'
Minitest::Reporters.use!

class Exercise1Test < Minitest::Test
  attr_accessor :register, :transaction

  def setup
    @register = CashRegister.new(1000.00)
    @transaction = Transaction.new(50)
    $stdin = StringIO.new("50\n")
  end

  def teardown
    $stdin = STDIN
  end

  def test_accept_money
    expected = [1000.00, 1050.00]
    before_transaction = register.total_money

    out, err = capture_io do
      transaction.prompt_for_payment
    end

    register.accept_money(transaction)
    after_transaction = register.total_money
    result = [before_transaction, after_transaction]
    assert_equal(expected, result)
  end
end
