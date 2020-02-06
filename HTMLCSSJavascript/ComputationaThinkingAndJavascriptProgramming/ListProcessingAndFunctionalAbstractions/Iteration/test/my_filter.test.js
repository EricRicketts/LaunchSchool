import { myFilter } from '../code/my_filter';

describe('Filtering and Selection Lesson my own filter method', function () {
  let count, triplets, expected, ary, isEven, isPythagoreanTriple, isMultipleOfThreeOrFive;
  beforeEach(() => {
    count = [1, 2, 3, 4, 5];
    ary = [1, 3, 5, 7, 11, 18, 16, 15];
    triplets = [
      { a: 3, b: 4, c: 5 },
      { a: 5, b: 12, c: 13 },
      { a: 1, b: 2, c: 3 },
    ];
    isEven = function(value) {
      return value % 2 === 0;
    };
    isPythagoreanTriple = function(triple) {
      return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
    };
    isMultipleOfThreeOrFive = function(value) {
      return value % 3 === 0 || value % 5 === 0;
    }
  });

  it('standard filter works for finding even numbers in an array', function () {
    expected = [2, 4];
    expect(count.filter(isEven)).toEqual(expected);
  });

  it('standard filter works for finding if numbers are multiples of three or five', function () {
    expected = [3, 5, 18, 15];
    expect(ary.filter(isMultipleOfThreeOrFive)).toEqual(expected);
  });

  it('standard filter should detect pythagorean triplets', function () {
    expected = [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ];
    expect(triplets.filter(isPythagoreanTriple)).toEqual(expected);
  });

  it('Launch School filter works for finding even numbers in an array', function () {
    expected = [2, 4];
    expect(myFilter(count, isEven)).toEqual(expected);
  });

  it('Launch School myFilter works for finding if numbers are multiples of three or five', function () {
    expected = [3, 5, 18, 15];
    expect(myFilter(ary, isMultipleOfThreeOrFive)).toEqual(expected);
  });

  it('Launch School myFilter should detect pythagorean triplets', function () {
    expected = [ { a: 3, b: 4, c: 5 }, { a: 5, b: 12, c: 13 } ];
    expect(myFilter(triplets, isPythagoreanTriple)).toEqual(expected);
  });
});