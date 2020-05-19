import {newAccount, makeAccountByItself, makeBank, makeBankPrivateVariables } from "../code/banking";

describe('JS225 Object Oriented Javascript Closures and Function Scope', function () {
  describe('Project: Banking with Objects and Closures', function () {
    let actual, expected;
    describe('A simple bank account object', function () {
      let account;
      beforeEach(() => {
        account = newAccount;
        account.clearAccount();
      });

      it('should start with a zero balance', function () {
        expect(account.balance).toBe(0);
      });

      it('should enable deposits', function () {
        let initialBalance = account.balance;
        let amountDeposited = account.deposit(42);
        expect([initialBalance, amountDeposited, account.balance]).toEqual([0, 42, 42]);
      });

      it('should enable withdraws', function () {
        account.deposit(100);
        let withdrawAmount = account.withdraw(19);
        expect([withdrawAmount, account.balance]).toEqual([19, 81]);
      });

      it('should not withdraw more than is in the account', function () {
        account.deposit(81);
        let initialBalance = account.balance;
        let withdrawAmount = account.withdraw(91);
        expect([initialBalance, withdrawAmount, account.balance]).toEqual([81, 81, 0]);
      });

      it('should store all transactions', function () {
        account.deposit(50);
        account.withdraw(25);
        actual = JSON.stringify(account.transactions);
        expected = '[{"type":"deposit","amount":50},{"type":"withdraw","amount":25}]';
        expect(actual).toEqual(expected);
      });
    });
    
    describe('Make different accounts', function () {
      it('should make two separate accounts', function () {
        let firstAccount = makeAccountByItself();
        let secondAccount = makeAccountByItself();
        firstAccount.deposit(50);
        firstAccount.withdraw(15);
        secondAccount.deposit(100);
        secondAccount.withdraw(10);
        actual = [firstAccount.balance, secondAccount.balance];
        expected = [35, 90];
        expect(actual).toEqual(expected);
      });
    });

    describe('Make and operate a bank', function () {
      let bank, firstAccount, secondAccount;
      beforeEach(() => {
        bank = makeBank();
      });
      it('should make a bank', function () {
        expect(bank.accounts).toEqual([]);
      });

      it('should open different accounts', function () {
        firstAccount = bank.openAccount();
        secondAccount = bank.openAccount();
        actual = [firstAccount.number, secondAccount.number];
        expected = [101, 102];
        expect(actual).toEqual(expected);
      });

      it('should deposit and withdraw from different accounts', function () {
        firstAccount = bank.openAccount();
        secondAccount = bank.openAccount();
        firstAccount.deposit(100);
        secondAccount.deposit(200);
        let firstAccountInitialBalance = firstAccount.balance;
        let secondAccountInitialBalance = secondAccount.balance;
        firstAccount.withdraw(50);
        secondAccount.withdraw(100);
        actual = [
          firstAccountInitialBalance, firstAccount.balance,
          secondAccountInitialBalance, secondAccount.balance
        ];
        expected = [100, 50, 200, 100];
        expect(actual).toEqual(expected);
      });

      it('should allow the transfer from one account to another', function () {
        firstAccount = bank.openAccount();
        secondAccount = bank.openAccount();
        firstAccount.deposit(10);
        bank.transfer(firstAccount, secondAccount, 7);
        expect([firstAccount.balance, secondAccount.balance]).toEqual([3, 7]);
      });
    });

    describe('Operate a bank but with private variables', function () {
      let bank, account;
      beforeEach(() => {
        bank = makeBankPrivateVariables();
      });

      it('should no longer access accounts by property', function () {
        expect(bank.accounts).toBe(undefined);
      });

      it('should privatize access to the account number, balance and transactions', function () {
        account = bank.openAccount();
        actual = [account.balance(), account.number(), account.transactions()];
        expected = [0, 101, []];
        expect(actual).toEqual(expected);
      });
    });
  });
});