import { shortHandRangeToArray, range, getNextSequenceNumber, processRange } from "../code/range_notation";

describe('LS215 A General Problem Solving Approach Practice Problem Four Range Notation', function () {
  let rangeString, expected;
  it('should return the bigger of two numbers for the next number in the sequence', function () {
    expect(getNextSequenceNumber('9', 3)).toBe(9);
  });

  it('should iterate if current number is smaller than prior number', function () {
    expect(getNextSequenceNumber('3', 8)).toBe(13);
  });

  it('should iterate if current number is equal to prior number', function () {
    expect(getNextSequenceNumber('2', 2)).toBe(12);
  });

  it('should iterate with a prior number in the tens', function () {
    expect(getNextSequenceNumber('2', 54)).toBe(62);
  });

  it('should iterate with a prior number in the hundreds', function () {
    expect(getNextSequenceNumber('5', 345)).toBe(355);
  });

  it('should iterate with current number having a leading zero', function () {
    expect(getNextSequenceNumber('02', 104)).toBe(202);
  });

  it('should iterate with prior number and current number in tens', function () {
    expect(getNextSequenceNumber('15', 35)).toBe(115);
  });

  it('should iterate with a three digit current number', function () {
    expect(getNextSequenceNumber('123', 421)).toBe(1123);
  });

  it('should produce a simple range with no prior number', function () {
    expected = [1, 2, 3];
    expect(processRange(['1', '3'])).toEqual(expected);
  });

  it('should produce a simple range with a prior number', function () {
    expected = range(564, 611);
    expect(processRange(['64', '11'], 545)).toEqual(expected);
  });

  it('should process a range with more than two endpoints', function () {
    expected = range(3, 12);
    expect(processRange(['3', '1', '2'])).toEqual(expected);
  });

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

  it('should show an increasing sequence even if two numbers in shorthand are the same', function() {
    rangeString = '5, 1, 2, 2, 1';
    expected = [5, 11, 12, 22, 31];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should do a simple range', function () {
    rangeString = '1-3';
    expected = [1, 2, 3];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should do a range with more than two endpoints', function () {
    rangeString = '1:5:2';
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should process shorthand notation for three and one digit.skip pairing', function () {
    rangeString = '104:2';
    expected = [104, 105, 106, 107, 108, 109, 110, 111, 112];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should process shorthand notation for three and two digit.skip pairing', function () {
    rangeString = '104:02';
    expected = range(104, 202);
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should process two ranges in a row', function () {
    rangeString = '1-3, 1-2';
    expected = [1, 2, 3, 11, 12];
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should process a mix of single numbers and ranges', function () {
    rangeString = '545, 64:11';
    expected = [545].concat(range(564, 611));
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });

  it('should process alternating mix of single numbers and ranges', function () {
    rangeString = '5, 32:23, 15, 13, 15..07, 102';
    expected = [5].concat(range(32, 123).concat(215, 313, range(315, 407), 1102));
    expect(shortHandRangeToArray(rangeString)).toEqual(expected);
  });
});