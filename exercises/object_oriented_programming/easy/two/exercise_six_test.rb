require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseSixTest < Minitest::Test
  class Wallet
    include Comparable

    def initialize(amount)
      @amount = amount
    end

    def <=>(other_wallet)
      self.amount <=> other_wallet.amount
    end

    protected

    attr_reader :amount
  end

  def test_one
    bills_wallet = Wallet.new(500)
    pennys_wallet = Wallet.new(465)
    expected = "Bill has more money than Penny"
    result = if bills_wallet > pennys_wallet
                "Bill has more money than Penny"
              elsif pennys_wallet > bills_wallet
                "Penny has more money than Bill"
              else
                "Bill and Penny have the same amount of money"
              end
    assert_equal(expected, result)
  end
end