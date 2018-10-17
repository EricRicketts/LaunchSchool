require 'minitest/autorun'
require 'minitest/pride'
require 'pry-byebug'

class ExerciseSevenTest < Minitest::Test
  attr_accessor :account_with_error, :account, :account_ls

  class BankAccountError
    attr_reader :balance

    def initialize(account_number, client)
      @account_number = account_number
      @client = client
      @balance = 0
    end

    def deposit(amount)
      if amount > 0
        self.balance += amount
        "$#{amount} deposited.  Total balance is $#{balance}."
      else
        "Invalid.  Enter a positive amount."
      end
    end

    def withdraw(amount)
      if amount > 0
        success = (self.balance -= amount)
      else
        success = false
      end

      if success
        "$#{amount} withdrawn.  Total balance is $#{balance}."
      else
        "Invalid.  Enter positive amount less than or equal to current balance ($#{balance})."
      end
    end

    def balance=(new_balance)
      if valid_transaction?(new_balance)
        @balance = new_balance
        true
      else
        false
      end
    end

    def valid_transaction?(new_balance)
      new_balance > 0
    end
  end

  class BankAccount
    attr_reader :balance

    def initialize(account_number, client)
      @account_number = account_number
      @client = client
      @balance = 0
    end

    def deposit(amount)
      if amount > 0
        self.balance += amount
        "$#{amount} deposited.  Total balance is $#{balance}."
      else
        "Invalid.  Enter a positive amount."
      end
    end

    def withdraw(amount)
      new_balance = self.balance - amount

      if valid_transaction?(new_balance) && amount > 0
        self.balance = new_balance
        success = true
      else
        success = false
      end

      if success
        "$#{amount} withdrawn.  Total balance is $#{balance}."
      else
        "Invalid.  Enter positive amount less than or equal to current balance ($#{balance})."
      end
    end

    protected

    def balance=(new_balance)
      @balance = new_balance
    end

    private

    def valid_transaction?(new_balance)
      new_balance > 0
    end
  end

  class BankAccountLS
    attr_reader :balance

    def initialize(account_number, client)
      @account_number = account_number
      @client = client
      @balance = 0
    end

    def deposit(amount)
      if amount > 0
        self.balance += amount
        "$#{amount} deposited.  Total balance is $#{balance}."
      else
        "Invalid.  Enter a positive amount."
      end
    end

    def withdraw(amount)
      new_balance = self.balance - amount

      if valid_transaction?(new_balance) && amount > 0
        self.balance = new_balance
        "$#{amount} withdrawn.  Total balance is $#{balance}."
      else
        "Invalid.  Enter positive amount less than or equal to current balance ($#{balance})."
      end

    end

    protected

    def balance=(new_balance)
      @balance = new_balance
    end

    private

    def valid_transaction?(new_balance)
      new_balance > 0
    end
  end

  def setup
    @account_with_error = BankAccountError.new('5538898', 'Genevieve')
    @account = BankAccount.new('5538898', 'Genevieve')
    @account_ls = BankAccountLS.new('5538898', 'Genevieve')
  end

  def test_one
    # we see this unexpected behavior because in line 28 of BankAccountError#withdraw
    # the "-" operator executes and returns (balance - withdraw) which is a number
    # since any number is true from a boolean perspective the false branch in
    # BankAccountError#withdraw never gets executed.  In our example we have a balance
    # if 50 but a withdraw of 80 so the return value for (self.balance -= amount) is
    # -30 which set the 'success' local variable.  -30 is truthy so the true branch
    # gets executed in the BankAccountError#withdraw method.
    account_with_error.deposit(50)
    assert_equal(50, account_with_error.balance)
    expected = "$80 withdrawn.  Total balance is $50."
    assert_equal(expected, account_with_error.withdraw(80))
  end

  def test_two
    expected = [
      0, 50,
      "Invalid.  Enter positive amount less than or equal to current balance ($50).",
      50
    ]

    initial_balance = account.balance
    account.deposit(50)
    first_deposit = account.balance
    withdraw_error = account.withdraw(80)
    results = [
      initial_balance, first_deposit, withdraw_error, account.balance
    ]

    assert_equal(expected, results)
  end

  def test_three
    # I was kind of on the correct track, but the answer is that with regards to setters
    # Ruby will execute the setter method whenever you call it, however a setter will
    # ALWAYS return the supplied parameter not NOT the result of the method, though the
    # method will get executed.
    expected = [
      0, 50,
      "Invalid.  Enter positive amount less than or equal to current balance ($50).",
      50
    ]

    initial_balance = account_ls.balance
    account_ls.deposit(50)
    first_deposit = account_ls.balance
    withdraw_error = account_ls.withdraw(80)
    results = [
      initial_balance, first_deposit, withdraw_error, account_ls.balance
    ]

    assert_equal(expected, results)
  end
end