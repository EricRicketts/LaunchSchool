import { transpose } from "../code/transpose_mxn";

describe('JS210 Small Problems Advanced One Exercise Three', function () {
  let arr, expected;

  it('should transpose a square matrix', function () {
    arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    expected = [[1, 4, 7], [2, 5, 8], [3, 6, 9]];
    expect(transpose(arr)).toEqual(expected);
  });

  it('should transpose nonsymetric matrix', function () {
    arr = [[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]];
    expected = [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]];
    expect(transpose(arr)).toEqual(expected);
  });

  it('should transpose a simple one element array', function () {
    expect(transpose([[1]])).toEqual([[1]]);
  });

  it('should transpose an array with one row', function () {
    arr = [[1, 2, 3, 4]];
    expected = [[1], [2], [3], [4]];
    expect(transpose(arr)).toEqual(expected);
  });

  it('should transpose four single element rows into one four element row', function () {
    arr = [[1], [2], [3], [4]];
    expected = [[1, 2, 3, 4]];
    expect(transpose(arr)).toEqual(expected);
  });
});