import { digitList } from "../code/digit_list";

describe('Exercises JS210 Small Problems Easy Four Exercise Seven', function () {
  var num, expected;
  it('converts a five digit number to an array of five digits', function () {
    num = 12345;
    expected = [1, 2, 3, 4, 5];
    expect(digitList(num)).toEqual(expected);
  });

  it('converts a single digit number to an array with one number', function () {
    num = 7;
    expected = [7];
    expect(digitList(7)).toEqual(expected);
  });

  it('converts a six digit number to an array of six digits', function () {
    num = 375290;
    expected = [3, 7, 5, 2, 9, 0];
    expect(digitList(num)).toEqual(expected);
  });

  it('converts a number with all of the same digits to an array of all the same numbers', function () {
    num = 444;
    expected = [4, 4, 4];
    expect(digitList(num)).toEqual(expected);
  });
});