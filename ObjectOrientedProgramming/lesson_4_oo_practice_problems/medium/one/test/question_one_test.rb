require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

=begin
Problem Statement

Ben asked Alyssa to code review the following code:

class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

Alyssa glanced over the code quickly and said -
"It looks fine, except that you forgot to put the @ before
balance when you refer to the balance instance variable in
the body of the positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?
=end

class QuestionOneTest < Minitest::Test
  class BankAccount
    attr_reader :balance

    def initialize(starting_balance)
      @balance = starting_balance
    end

    def positive_balance?
      balance >= 0
    end
  end

  def test_1
    # Ben is correct since balance is a reader attribute
    # the reader method is called and it will return the
    # value it was set to in the constructor, with the
    # attr_reader method, Ruby creates a method called
    # BankAccount#balance which returns the value of
    # the instance variable @balance
    account = BankAccount.new(100)
    assert(account.positive_balance?)
  end
end