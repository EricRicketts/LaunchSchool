import { shortHandRangeToArray } from "../code/range_notation";

describe('LS215 A General Problem Solving Approach Practice Problem Four Range Notation', function () {
  let rangeString, expected;
  it('should provide a simple range with comma separated numbers only', function () {
    rangeString = "1, 3, 7, 2, 4, 1";
    expected = [1, 3, 7, 12, 14, 21];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should handle larger required power of ten increments', function () {
    rangeString = '5, 8, 45, 2, 101, 2, 443, 32, 732, 189';
    expected = [5, 8, 45, 52, 101, 102, 443, 532, 732, 1189];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });
});