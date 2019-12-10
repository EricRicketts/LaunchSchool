import { concat } from '../code/concat.js';

describe('Javascript Language Fundamentals: Arrays, Exercise 4', () => {
  var a, b, c, expected, obj;
  
  beforeEach(() => {
    a = [1, 2, 3];
    obj = { a: 2, b: 3 };
  });

  it('concats any number of numeric arrays', () => {
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9];
    b = [4, 5, 6];
    c = [7, 8, 9];

    expect(concat(a, b, c)).toEqual(expected);
  });

  it('concats a mix of individual data types, and arrays of different data types', () => {
    expected = [1, 2, 3, 'a', 'one', 'two'];
    b = 'a';
    c = ['one', 'two'];

    expect(concat(a, b, c)).toEqual(expected);
  });

  it('concats an object even if the object is in an array', () => {
    b = ['one', 3, obj];
    expected = [1, 2, 3, 4, 5, 'one', 3, obj];

    expect(concat(a, 4, 5, b)).toEqual(expected);
  });
});