import { slice, splice } from '../code/slice_splice.js';

describe('Exercises; Javascript Language Fundamentals; Arrays; Exercise 8', () => {
  var arr, expected;
  beforeEach(() => {
    arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  });

  describe('Array slice behavior', () => {
    describe('One argument', () => {
      it('returns the a copy of the array', () => {
        expect(slice(arr)).toEqual(expected); 
      });      
    });

    describe('Two arguments', () => {
      it('non-numeric input returns entire array', () => {
        expect(slice(arr, undefined)).toEqual(expected);
      });

      it('NaN returns entire array', () => {
        expect(slice(arr, NaN)).toEqual(expected);
      });

      it('in range positive number is first index to end of array', () => {
        expected = [3, 4, 5, 6, 7, 8, 9];
        expect(slice(arr, 3)).toEqual(expected);
      });
      
      it('out of range positive number returns empty array', () => {
        expect(slice(arr, 10)).toEqual([]);
      });

      it('in range negative number works backwards from the end of the array', () => {
        expected = [6, 7, 8, 9];
        expect(slice(arr, -4)).toEqual(expected);
      });

      it('out of range negative number returns entire array', () => {
        expect(slice(arr, -11)).toEqual(expected);
      });
    });

    describe('Three arguments', () => {
      it('if second argument not a number and third argument undefined return entire array', () => {
        expect(slice(arr, null, undefined)).toEqual(expected);
      });

      it('if second argument is NaN and third argument is undefined return entire array', () => {
        expect(slice(arr, NaN, undefined)).toEqual(expected);
      });

      it('second argument number and third argument undefined treat like two arguments', () => {
        expected = [5, 6, 7, 8, 9];
        expect(slice(arr, 5, undefined)).toEqual(expected);
        expect(slice(arr, -5, undefined)).toEqual(expected);
      });

      it('both in range integers returns array from second argument as first index up to but not including third argument as second index', () => {
        expected = [2, 3, 4, 5];
        expect(slice(arr, 2, 6)).toEqual(expected);
      });

      it('third argument valid negative index ', () => {
        expected = [2, 3, 4, 5, 6, 7];
        expect(slice(arr, 2, -2)).toEqual(expected);
      });

      it('second argument valid negative index', () => {
        expected = [3, 4, 5, 6];
        expect(slice(arr, -7, 7)).toEqual(expected);
      });

      it('second argument greater than third argument returns emtpy array', () => {
        expect(slice(arr, 6, 2)).toEqual([]);
      });

      it('normalized second argument greater than third argument empty array', () => {
        expect(slice(arr, -3, -4)).toEqual([]);
      });

      it('second argument larger than last index always returns empty array', () => {
        expect(slice(arr, 10, 4)).toEqual([]);  
      });

      it('valid second argument third argument larger than array returns second argument to end of array', () => {
        expected = [7, 8, 9];
        expect(slice(arr, 7, 10)).toEqual(expected);
      });

      it('second argument not number and third argument number return array from third argument to end of array', () => {
        expected = [0, 1, 2, 3, 4, 5];
        expect(slice(arr, undefined, 6)).toEqual(expected);
      });

      it('second argument not number and third argument negative return array from third argument to end of array', () => {
        expected = [0, 1, 2, 3 ,4, 5, 6, 7];
        expect(slice(arr, 'foo', -2)).toEqual(expected);      
      });

      it('second argument not number and third argument larger than array returns entire array', () => {
        expect(slice(arr, NaN, 10)).toEqual(expected);
      });
    });

  });  
});