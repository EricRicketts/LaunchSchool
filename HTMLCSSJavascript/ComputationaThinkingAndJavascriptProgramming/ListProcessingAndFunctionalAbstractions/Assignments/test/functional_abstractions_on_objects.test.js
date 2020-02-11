import { doubleObjectValues, keepEvenValues, getTotalFromInvoice } from "../code/functional_abstractions_on_objecs";

describe('LS215 List Processing and Functional Abstractions Objects', function () {
  let object, expected, result, invoice;
  beforeEach(() => {
    object = { a: 1, b: 2, c: 3 };
    invoice = { phone: 10000, internet: 8000, tax: 3000 };
  })
  it('should return keys when using Object.keys', function () {
    expected = ['a', 'b', 'c'];
    result = [];
    Object.keys(object).forEach(function(key) {
      result.push(key);
    });

    expect(result).toEqual(expected);
  });

  it('should return values when using Object.keys and map', function () {
    expected = [1, 2, 3];
    result = Object.keys(object).map(function(key) {
      return object[key];
    });

    expect(result).toEqual(expected);
  });

  it('should return keys and values using Object.keys and reduce', function () {
    expected = [['a', 1], ['b', 2], ['c', 3]];
    result = Object.keys(object).reduce(function(arr, key) {
      arr.push([key, object[key]]);
      return arr;
    }, []);

    expect(result).toEqual(expected);
  });

  it('should double values and produce a new object', function () {
    expected = { a: 2, b: 4, c: 6 };
    expect(doubleObjectValues(object)).toEqual(expected);
  });

  it('should keep the even values of an object', function () {
    expected = { b: 2 };
    expect(keepEvenValues(object)).toEqual(expected);
  });

  it('should sum the totals of an invoice', function () {
    expected = { total: 21000 };
    expect(getTotalFromInvoice(invoice)).toEqual(expected);
  });
});