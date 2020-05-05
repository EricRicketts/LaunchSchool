import { invoices } from "../code/invoices";

describe('JS225 Object Oriented Javascript: Objects: Practice Problem One: Objects', function () {
  let actual, expected;
  beforeEach(() => {
    invoices.unpaid = [];
    invoices.paid = [];
  });
  it('should have an empty array for unpaid invoices', function () {
    expect(invoices.unpaid).toEqual([]);
  });

  it('should add an unpaid invoice', function () {
    invoices.add('Starbucks', 300);
    expected = [{ name: 'Starbucks', amount: 300 }];
    expect(invoices.unpaid).toEqual(expected);
  });

  it('should return the total amount due for unpaid invoices', function () {
    [['Due North Development', 250], ['Moonbeam Interactive', 187.50], ['Slough Digital', 300]].forEach((args) => {
      invoices.add(args[0], args[1]);
    });
    expect(invoices.totalDue()).toBe(737.50);
  });

  it('should have an empty array for paid invoices', function () {
    expect(invoices.paid).toEqual([]);
  });

  it('should add to unrecognized invoices if the name does not match. leaving unpaid invoices unchanged', function () {
    [['Due North Development', 250], ['Moonbeam Interactive', 187.50], ['Slough Digital', 300]].forEach((args) => {
      invoices.add(args[0], args[1]);
    });
    expected = [
      { name: 'Due North Development', amount: 250 },
      { name: 'Moonbeam Interactive', amount: 187.50 },
      { name: 'Slough Digital', amount: 300 }
    ];
    invoices.payInvoice('Foo Bar');
    expect(invoices.unrecognized).toEqual(['Foo Bar']);
    expect(invoices.unpaid).toEqual(expected);
  });

  it('should transfer paid invoices from unpaid invoices', function () {
    [['Due North Development', 250], ['Moonbeam Interactive', 187.50], ['Slough Digital', 300]].forEach((args) => {
      invoices.add(args[0], args[1]);
    });
    invoices.payInvoice('Due North Development');
    invoices.payInvoice('Slough Digital');
    let expectedPaid = [
      { name: 'Due North Development', amount: 250 }, { name: 'Slough Digital', amount: 300 }
      ];
    let expectedUnpaid = [{ name: 'Moonbeam Interactive', amount: 187.50 }];
    expect(invoices.paid).toEqual(expectedPaid);
    expect(invoices.unpaid).toEqual(expectedUnpaid);
  });

  it('should sum paid and unpaid invoices upon transferal between accounts', function () {
    [['Due North Development', 250], ['Moonbeam Interactive', 187.50], ['Slough Digital', 300]].forEach((args) => {
      invoices.add(args[0], args[1]);
    });
    invoices.payInvoice('Due North Development');
    invoices.payInvoice('Slough Digital');
    expect(invoices.totalDue()).toBe(187.50);
    expect(invoices.totalPaid()).toBe(550);
  });
});