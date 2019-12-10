import { missing, range } from '../code/find_missing_numbers.js';

describe('Practice Problems: testing range function', () => {
  it('provides a rangen from 0 to 4 with step 1', () => {
    expect(range(0, 4, 1)).toEqual([0, 1, 2, 3, 4]);
  });

  it('provides a range from 1 to 2 with step 2', () => {
    expect(range(1, 10, 2)).toEqual([1, 3, 5, 7, 9]);
  });
  
  it('provides ranges with negative numbers', () => {
    expect(range(-3, 3, 1)).toEqual([-3, -2, -1, 0, 1, 2, 3]);
  });

  it('provides a 1 element range', () => {
    expect(range(5, 5, 1)).toEqual([5]);
  });
});

describe('Practice Problems: Find missing numbers', () => {
  it('fills in missing negative numbers', () => {
    const arr = [-3, -2, 1, 5];
    const expected = [-1, 0, 2, 3, 4];
    expect(missing(arr)).toEqual(expected);
  });

  it('returns an empty array if there are no missing numbers', () => {
    const arr = [1, 2, 3, 4];
    expect(missing(arr)).toEqual([]);
  });

  it('returns positive missing numbers', () => {
    const arr = [1, 5];
    const expected = [2, 3, 4];
    expect(missing(arr)).toEqual(expected);
  });

  it('returns empty array for single element array', () => {
    expect(missing([6])).toEqual([]);
  });
});