import { myOwnEvery, myOwnSome } from "../code/my_every_some";

describe('Interrogation Lesson my own versions of every and some', function () {
  let count, strArr, mixedArr, odd, isNumber, isString, arr;

  beforeEach(() => {
    count = [1, 2, 3, 4, 5];
    strArr = ['a', 'a234', '1abc'];
    mixedArr = [0, 3, '3', 4, '10', 5, 'foo'];
    isNumber = function(value) {
      return typeof value === 'number' && !Number.isNaN(value);
    };
    isString = function(value) {
      return typeof value === 'string';
    };
    odd = function(value) {
      return value % 2 === 1;
    };
  });

  it('standard some check for odd numbers in odd and even array returns true', function () {
    expect(count.some(odd)).toBe(true);
  });

  it('standard some every for odd numbers in odd and even array returns false', function () {
    expect(count.every(odd)).toBe(false);
  });

  it('standard some returns false on string only array when checking for numbers', function () {
    expect(strArr.some(isNumber)).toBe(false);
  });
  it('standard every returns true on string array checking for all strings', function () {
    expect(strArr.every(isString)).toBe(true);
  });

  it('standard some returns true when checking for numbers or strings in a mixed array', function () {
    expect(mixedArr.some(isNumber)).toBe(true);
    expect(mixedArr.some(isString)).toBe(true);
  });

  it('standard every returns false when checking for numbers and strings in mixed array', function () {
    expect(mixedArr.every(isNumber)).toBe(false);
    expect(mixedArr.every(isString)).toBe(false);
  });

  it('my own some check for odd numbers in odd and even array returns true', function () {
    expect(myOwnSome(count, odd)).toBe(true);
  });

  it('my own some every for odd numbers in odd and even array returns false', function () {
    expect(myOwnEvery(count, odd)).toBe(false);
  });

  it('my own some returns false on string only array when checking for numbers', function () {
    expect(myOwnSome(strArr, isNumber)).toBe(false);
  });

  it('my own every returns true on string array checking for all strings', function () {
    expect(myOwnEvery(strArr, isString)).toBe(true);
  });

  it('my own some returns true when checking for numbers or strings in a mixed array', function () {
    expect(myOwnSome(mixedArr, isNumber)).toBe(true);
    expect(myOwnSome(mixedArr, isString)).toBe(true);
  });

  it('my own every returns false when checking for numbers and strings in mixed array', function () {
    expect(myOwnEvery(mixedArr, isNumber)).toBe(false);
    expect(myOwnEvery(mixedArr, isString)).toBe(false);
  });
});