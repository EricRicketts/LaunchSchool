require 'minitest/autorun'
require 'minitest/reporters'
require 'stringio'
require 'pry-byebug'
require_relative './transaction'
Minitest::Reporters.use!

class Exercise6Test < Minitest::Test
  attr_accessor :transaction

  def setup
    @transaction = Transaction.new(50.00)
    $stdin = StringIO.new("25.00\n60.00\n")
  end

  def teardown
    $stdin = STDIN
  end

  def test_prompt_for_payment
    item_cost = 50.0
    valid_payment = 60.0
    expected_output = [
      "You owe $#{item_cost}.",
      "How much are you paying?",
      "That is not the correct amount. Please make sure to pay the full cost.",
      "You owe $#{item_cost}.",
      "How much are you paying?"
    ]

    out, err = capture_io do
      transaction.prompt_for_payment
    end

    output_results = out.split("\n")
    expected = [valid_payment, expected_output]
    results = [transaction.amount_paid, output_results]

    assert_equal(expected, results)
  end
end