require 'minitest/autorun'
require 'minitest/reporters'
require 'pry-byebug'
require 'stringio'
require_relative './cash_register'
require_relative './transaction'
Minitest::Reporters.use!

class Exercise4Test < Minitest::Test
  attr_accessor :register, :transaction

  def setup
    @register = CashRegister.new(1000.00)
    @transaction = Transaction.new(25)
    $stdin = StringIO.new("50\n")
  end

  def teardown
    $stdin = STDIN
  end

  def test_accept_money
    out, err = capture_io do
      transaction.prompt_for_payment
    end
    assert_equal(transaction.item_cost.to_f, register.change(transaction))
  end
end
