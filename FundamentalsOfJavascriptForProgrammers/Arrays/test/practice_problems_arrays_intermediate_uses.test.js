import {
  combinedArray, mirrorArray, oddElementsOf, orderAndReverseOrder
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
});