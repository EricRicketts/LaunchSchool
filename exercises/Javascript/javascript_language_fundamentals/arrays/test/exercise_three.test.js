import { concat } from '../code/concat.js';

describe('Javascript Language Fundamentals: Arrays, Exercise 3', () => {
  var a, expected, obj;

  beforeEach(() => {
    a = [1, 2, 3];
    obj = { a: 2, b: 3 };
  });

  it('returns a new array if both arguments are arrays of numbers', () => {
    var b = [4, 5, 6];
    expected = [1, 2, 3, 4, 5, 6];
    
    expect(concat(a, b)).toEqual(expected);
  }); 
  
  it('returns an array of the second argument and on are just numbers', () => {
    expected = [1, 2, 3, 4, 5, 6];

    expect(concat(a, 4, 5, 6)).toEqual(expected);
  });

  it('returns a new array of mixed primitives if both arrays are not the same data type', () => {
    var b = ['four', 'five', 'six'];
    expected = [1, 2, 3, 'four', 'five', 'six'];

    expect(concat(a, b)).toEqual(expected);
  });

  it('returns a new array of mixed primitives if the second argument and on are not numbers', () => {
    expected = [1, 2, 3, 'four', 'five', 'six'];

    expect(concat(a, 'four', 'five', 'six')).toEqual(expected);
  });

  it('return can include an object along with primitives', () => {
    expected = [1, 2, 3, { a: 2, b: 3 }];

    expect(concat(a, obj)).toEqual(expected);
  });

  it('changing the object affects the object in the concatenated array', () => {
    expected = [1, 2, 3, { a: 'two', b: 3 }];
    var newArray = concat(a, obj);
  
    obj.a = 'two';
    expect(newArray).toEqual(expected);
  });

  it('concatenated object still mutable even if part of an array', () => {
    expected = [1, 2, 3, 4, 5, obj];
    var b = [4, 5, obj];
    var newArray = concat(a, b);

    expect(newArray).toEqual(expected);
  
    obj.b = 'three';
    expected = [1, 2, 3, 4, 5, { a: 2, b: 'three' }];
    expect(newArray).toEqual(expected);

    newArray[5].b = 3;
    expected = [1, 2, 3, 4, 5, { a: 2, b: 3 }];
    expect(newArray).toEqual(expected);
    expect(obj).toEqual({ a: 2, b: 3 });
  });
});