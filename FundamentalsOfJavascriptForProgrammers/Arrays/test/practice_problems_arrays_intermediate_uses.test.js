import {
  combinedArray, matrixSums, mirrorArray, oddElementsOf,
  orderAndReverseOrder, sortDescending, uniqueElements
} from '../code/arrays_intermediate_uses.js';

describe('Practice Problems: Intermediate Array Uses', () => {
  var digits, letters;

  beforeEach(() => {
    digits = [4, 8, 15, 16, 23, 42];
    letters = ['A', 'L', 'V', 'A', 'R', 'H'];
  });

  it('oddElementsOf returns all odd indexed elements of the array', () => {
    const expected = [8, 16, 42];
    expect(oddElementsOf(digits)).toEqual(expected);
  });

  it('combinedArray takes even positions from first array and odd positions from second array', () => {
    const expected = [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"];
    expect(combinedArray(digits, letters)).toEqual(expected);
  });

  it('orderAndReversedOrder takes orignal order plus reversed reversed order', () => {
    const expected = [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4];
    expect(orderAndReverseOrder(digits)).toEqual(expected);
  });

  it('mirrorArray is Launch School\'s solution to the previous problem', () => {
    const expected = [4, 8, 15, 16, 23, 42, 42, 23, 16, 15, 8, 4];
    expect(mirrorArray(digits)).toEqual(expected);
  });

  it('sortDescending returns an array in descending sort order', () => {
    const ary = [23, 4, 16, 42, 8, 15];
    const expected = [42, 23, 16, 15, 8, 4];
    expect(sortDescending(ary)).toEqual(expected);
    expect(ary).toEqual(ary);  // original array unchanged
  });

  it('matrixSums returns a new array which constains sums of subarrays', () => {
    const arr = [[2, 8, 5], [12, 48, 0], [12]];
    const expected = [15, 60, 12];
    expect(matrixSums(arr)).toEqual(expected);
  });

  it('uniqueElements returns an arry of unique elements', () => {
    const arr = [1, 2, 4, 3, 4, 1, 5, 4];
    const expected = [1, 2, 3, 4, 5];
    expect(uniqueElements(arr)).toEqual(expected);
  });
});