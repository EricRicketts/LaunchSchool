import { union } from '../code/union';

describe('Exercises JS210 Small Problems Easy Four Exercise Two', function () {
  var expected;
  it('unions two arrays', function () {
    expected = [1, 3, 5, 6, 9];
    expect(union([1, 3, 5], [3, 6, 9])).toEqual(expected);
  });

  it('union of larger arrays', function () {
    var arr1 = [3, 6, 9, 9, 10, 12, 20, 30];
    var arr2 = [9, 25, 35, 20, 20, 20, 3, 3, 3];
    expected = [3, 6, 9, 10, 12, 20, 25, 30, 35];
    expect(union(arr1, arr2)).toEqual(expected);
  });
});