let account = {
  balance: 0,
  transactions: [],
  clearBalance: function() {
    this.balance = 0;
    return this.balance;
  },
  clearTransactions: function() {
    this.transactions = [];
    return this.transactions;
  },
  clearAccount: function() {
    this.clearBalance();
    this.clearTransactions();
  },
  deposit: function(credit) {
    this.balance += credit;
    this.transactions.push({ type: 'deposit', amount: credit });
    return credit;
  },
  withdraw: function(debit) {
    let withdrawAmount = this.balance >= debit ? debit : this.balance;
    this.balance -= withdrawAmount;
    this.transactions.push({ type: 'withdraw', amount: withdrawAmount });
    return withdrawAmount;
  }
}

let newAccount = account;

function makeAccountByItself() {
  return {
    balance: 0,
    transactions: [],
    clearBalance: function() {
      return this.balance = 0;
    },
    clearTransactions: function() {
      this.transactions = [];
      return this.transactions;
    },
    clearAccount: function() {
      this.clearBalance();
      this.clearTransactions();
    },
    deposit: function(credit) {
      this.balance += credit;
      this.transactions.push({ type: 'deposit', amount: credit });
      return credit;
    },
    withdraw: function(debit) {
      let withdrawAmount = this.balance >= debit ? debit : this.balance;
      this.balance -= withdrawAmount;
      this.transactions.push({ type: 'withdraw', amount: withdrawAmount });
      return withdrawAmount;
    }
  }
}

function makeAccount(number) {
  let account = makeAccountByItself();
  return {
    number: number,
    balance: 0,
    transactions: [],
    clearBalance: account.clearBalance,
    clearTransactions: account.clearTransactions,
    clearAccount: account.clearAccount,
    deposit: account.deposit,
    withdraw: account.withdraw
  }
}

function makeAccountPrivateVariables(number) {
  let balance = 0;
  let transactions = [];
  return {
    number: function() {
      return number;
    },
    balance: function() {
      return balance;
    },
    transactions: function() {
      return transactions;
    },
    clearBalance: function() {
      balance = 0;
      return balance;
    },
    clearTransactions: function() {
      transactions = [];
      return transactions;
    },
    clearAccount: function() {
      this.clearBalance();
      this.clearTransactions();
    },
    deposit: function(credit) {
      balance += credit;
      transactions.push({ type: 'deposit', amount: credit });
      return credit;
    },
    withdraw: function(debit) {
      let withdrawAmount = balance >= debit ? debit : balance;
      balance -= withdrawAmount;
      this.transactions.push({ type: 'withdraw', amount: withdrawAmount });
      return withdrawAmount;
    }
  }
}

function makeBank() {
  return {
    accounts: [],
    openAccount: function() {
      let number = this.accounts.length + 101;
      let account = makeAccount(number);
      this.accounts.push(account);
      return account;
    },
    transfer: function(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    }
  }
}


function makeBankPrivateVariables() {
  let accounts = [];
  return {
    openAccount: function() {
      let number = accounts.length + 101;
      let account = makeAccountPrivateVariables(number);
      accounts.push(account);
      return account;
    },
    transfer: function(source, destination, amount) {
      return destination.deposit(source.withdraw(amount));
    }
  }
}

export { newAccount, makeAccountByItself, makeBank, makeBankPrivateVariables };
/*
I really had a hard time properly designing the makeBank function, I ended up looking at the Launch School
solution and I am glad I did, because my code was turning into a rat's nest.  I can tell the Launch School
instructors have a lot of experience in project design.  I was having problems isolating and incrementing
the account number.  LS lets the account number be a function of the number of accounts, but this can be
a problem if an account is deleted.  Regardless, I like how the issue of the account number and adding the
account to the bank accounts collection is solved.
*/