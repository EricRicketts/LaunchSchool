import { pop, push } from '../code/pop_push.js';

describe('Exercises; Javascript Language Fundamentals; Arrays; Exercise 5', () => {
  var arr, expected;

  beforeEach(() => {
    arr = [1, 2, 3];
  });

  describe('pop functionality', () => {
    it('returns the popped item', () => {
      expect(pop(arr)).toBe(3);
    });

    it('array is reduced by one in size', () => {
      expected = [1, 2];
      pop(arr);
      expect(arr).toEqual(expected);
    });

    it('pop returns undefined for an empty array', () => {
      expect(pop([])).toBeUndefined();
    });

    it('treats compound data types as individual elements', () => {
      arr = [1, 2, ['a', 'b', 'c']];
      expected = ['a', 'b', 'c'];
      expect(pop(arr)).toEqual(expected);
    });
  });

  describe('push functionality', () => {
    it('returns the new array length', () => {
      expect(push(arr, 4, 5, 6)).toBe(6);
    });

    it('modifies the original array', () => {
      expected = [1, 2, 3, 4, 5, 6];
      push(arr, 4, 5, 6);
      expect(arr).toEqual(expected);
    });

    it('treats compound data types as one element', () => {
      expected = [1, 2, 3, 4, 5, ['a', 'b']];
      expect(push(arr, 4, 5, ['a', 'b'])).toBe(6);
      expect(arr).toEqual(expected);
    });

    it('push onto empty array', () => {
      arr = [];
      expect(push(arr, 1)).toBe(1);
      expect(arr).toEqual([1]);
    });

    it('pushing nothing changes nothing', () => {
      arr = [];
      expect(push(arr)).toBe(0);
      expect(arr).toEqual([]);
    });
  });
});