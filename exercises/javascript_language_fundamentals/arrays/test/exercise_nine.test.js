import { oddities, compareArrays } from '../code/oddities.js';

describe('Exercises; Javascript Language Fundamentals; Arrays; Exercise 9', () => {
  var input, expected;

  beforeEach(() => {
    input = [2, 3, 4, 5, 6];
    expected = [2, 4, 6];
  });

  it('returns every other element starting with index zero', () => {
    expect(oddities(input)).toEqual(expected);
  });

  it('Javascript compares equality by reference', () => {
    expect(oddities(input) === expected).toBeFalsy();
  });

  it('compound values need to be compared element by element', () => {
    expect(compareArrays(oddities(input), expected)).toBeTruthy();
  });
});