import { halvsies } from "../code/halvsies";

describe('Exercises JS210 Small Problems Easy Four Exercise Three', function () {
  var arr, expected;
  it('splits an even numbered array in half', function () {
    arr = [1, 2, 3, 4];
    expected = [[1, 2], [3, 4]];
    expect(halvsies(arr)).toEqual(expected);
  });

  it('odd numbered array has one more element in the first half', function () {
    arr = [1, 5, 2, 4, 3];
    expected = [[1, 5, 2], [4, 3]];
    expect(halvsies(arr)).toEqual(expected);
  });

  it('one element array has one element array and empty array', function () {
    arr = [5];
    expected = [[5], []];
    expect(halvsies(arr)).toEqual(expected);
  });

  it('splits an empty array into two empty arrays', function () {
    arr = [];
    expected = [[], []];
    expect(halvsies(arr)).toEqual(expected);
  });
});