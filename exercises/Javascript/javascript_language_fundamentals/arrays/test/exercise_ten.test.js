import { areArraysEqual } from '../code/equal_arrays.js';

describe('Exercises; Javascript Language Fundamentals; Arrays; Exercise 10', () => {
  var input1, input2;

  beforeEach(() => {
    input1 = [1, 2, 3];
    input2 = [1, 2, 3];
  });

  it('arrays equal by both value and index ', () => {
    expect(areArraysEqual(input1, input2)).toBeTruthy();
  });

  it('arrays equal by value', () => {
    input2 = [3, 2, 1];
    expect(areArraysEqual(input1, input2)).toBeTruthy();
  });

  it('works for string characters', () => {
    input1 = ['a', 'b', 'c'];
    input2 = ['b', 'c', 'a'];
    expect(areArraysEqual(input1, input2)).toBeTruthy();
  });

  it('if one element is not common return false', () => {
    input2 = ['1', 2, 3];
    expect(areArraysEqual(input1, input2)).toBeFalsy();
  });

  it('true if duplicated elements out of order', () => {
    input1 = [1, 1, 2, 3];
    input2 = [3, 1, 2, 1];
    expect(areArraysEqual(input1, input2)).toBeTruthy();
  });

  it('missing one element is false', () => {
    input1 = [1, 2, 3, 4];
    input2 = [1, 1, 2, 3];
    expect(areArraysEqual(input1, input2)).toBeFalsy();
  });

  it('missing two elements is false', () => {
    input1 = [1, 1, 2, 2];
    input2 = [4, 2, 3, 1];
    expect(areArraysEqual(input1, input2)).toBeFalsy();
  });

  it('missing one element smaller array is false', () => {
    input1 = [1, 1, 2];
    input2 = [1, 2, 2];
    expect(areArraysEqual(input1, input2)).toBeFalsy();
  });

  it('arrays of unequal length are false', () => {
    input1 = [1, 1, 1];
    input2 = [1, 1];
    expect(areArraysEqual(input1, input2)).toBeFalsy();
  });

  it('duplicate arrays are equal', () => {
    input1 = [1, 1];
    input2 = [1, 1];
    expect(areArraysEqual(input1, input2)).toBeTruthy();
  });
});