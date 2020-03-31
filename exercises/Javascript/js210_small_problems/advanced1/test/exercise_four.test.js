import { rotate90 } from "../code/rotating_matrices";

describe('JS210 Small Problems Advanced One Exercise Four', function () {
  let arr, expected;
  it('should rotate a symmetrical array', function () {
    arr = [[1, 5, 8], [4, 7, 2], [3, 9, 6]];
    expected = [[3, 4, 1], [9, 7, 5], [6, 2, 8]];
    expect(rotate90(arr)).toEqual(expected);
  });

  it('should rotate a non-symmetrical array', function () {
    arr = [[3, 7, 4, 2], [5, 1, 0, 8]];
    expected = [[5, 3], [1, 7], [0, 4], [8, 2]];
    expect(rotate90(arr)).toEqual(expected);
  });

  it('should return the original array when rotated four times', function () {
    arr = [[3, 7, 4, 2], [5, 1, 0, 8]];
    expect(rotate90(rotate90(rotate90(rotate90(arr))))).toEqual(arr);
  });
});