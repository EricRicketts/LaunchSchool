import { average } from "../code/array_average";

describe('Exercises JS210 Small Problems Easy Four Exercise Ten', function () {
  var arr;
  it('takes integer component of average in array of numbers', function () {
    arr = [1, 5, 87, 45, 8, 8];
    expect(average(arr)).toBe(25);
  });

  it('second test for average', function () {
    arr = [9, 47, 23, 95, 16, 52];
    expect(average(arr)).toBe(40);
  });
});