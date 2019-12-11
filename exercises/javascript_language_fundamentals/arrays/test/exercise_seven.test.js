import { shift, unshift } from '../code/shift_unshift.js';

describe('Exercises: Javascript Language Fundamentals: Arrays: Exercise 8', () => {
  var arr, expected;

  beforeEach(() => {
    arr = [1, 2, 3];
  });

  describe('shift removes and returns the first element of the array', () => {
    it('return the first element of the array', () => {
      expect(shift(arr)).toBe(1);      
    });

    it('removes first element from array', () => {
      shift(arr);
      expect(arr).toEqual([2, 3]);
    });

    it('shift empty array returns undefined', () => {
      expect(shift([])).toBeUndefined();
    });

    it('returns and removes first element even if not a primitive', () => {
      arr = [arr, 4, 5];
      expected = [1, 2, 3];
      expect(shift(arr)).toEqual(expected);
      expect(arr).toEqual([4, 5]);
    });
  });
  
  describe('unshift adds one element to the front of an array', () => {
    it('returns the new length of the array', () => {
      expect(unshift(arr, -2, -1, 0)).toBe(6);
    });

    it('unshift adds values to the array', () => {
      unshift(arr, -2, -1, 0);
      expected = [-2, -1, 0, 1, 2, 3];
      expect(arr).toEqual(expected);
    });

    it('unshift treats compound data types as one element', () => {
      expected = [-3, [-2, -1], 0, 1, 2, 3];
      expect(unshift(arr, -3, [-2, -1], 0)).toBe(6);
      expect(arr).toEqual(expected);
    });
  });
});