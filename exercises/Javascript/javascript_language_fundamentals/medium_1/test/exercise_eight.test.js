import { wrongProductOfSums, productOfSums } from '../code/product_of_sums.js';

describe('Exercises: Javascript Language Fundamentals: Medium One: Exercise Eight', function () {
  var array1, array2;

  beforeEach(() => {
    array1 = [1, 2, 3, 4, 5];
    array2 = [6, 7, 8, 9, 10];
  });

  it('explicit returns needed in functions', function () {
    expect(wrongProductOfSums(array1, array2)).toBeNaN();
  });

  it('fixes in place', function () {
    expect(productOfSums(array1, array2)).toBe(55);
  });
});