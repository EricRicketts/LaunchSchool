import { reverse } from '../code/reverse.js';

describe('Exercises; Javascript Language Fundamentals; Exercise 6', () => {
  describe('Can take a string argument', () => {
    it('reverse the characters of a string', () => {
      expect(reverse('Hello')).toBe('olleH');
    });

    it('reverse string does not change original string', () => {
      var str = 'Hello';
      reverse(str);
      expect(str).toBe('Hello');
    });

    it('reverse single character returns single character', () => {
      expect(reverse('a')).toBe('a');
    });
  });
  
  describe('Can take an array argument', () => {
    it('reverses elements of an array', () => {
      expect(reverse([1, 2, 3])).toEqual([3, 2, 1]);
    });

    it('reverse does not affect orignal array', () => {
      var arr = [1, 2, 3];
      reverse(arr);
      expect(arr).toEqual([1, 2, 3]);
    });
  });
});