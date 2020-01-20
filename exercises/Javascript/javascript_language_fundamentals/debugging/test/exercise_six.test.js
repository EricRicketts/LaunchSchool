import { logTransaction, transactionTotal, logTransactionFixed } from "../code/shop_transactions";

describe('Exercises JS210 Javascript Language Fundamentals ', function () {
  let transactionLog;
  beforeEach(() => {
    transactionLog = [];
  });
  it('does not catch an incorrect entry', function () {
    logTransaction('25.35', transactionLog);
    logTransaction('25.65', transactionLog);
    expect(transactionTotal(transactionLog)).toBe(51);
    expect(() => { logTransaction('foo', transactionLog); }).toThrowError(ReferenceError);
  });

  it('Fix now catches an error', function () {
    logTransactionFixed('35.45', transactionLog);
    expect(transactionLog).toEqual([35.45]);
    expect(logTransactionFixed('foo', transactionLog)).toBe('incorrect data entry');
  });
});