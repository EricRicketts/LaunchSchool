import { transpose } from "../code/transpose_3x3";

describe('JS210 Small Problems Advanced One Exercise Two', function () {
  let arr, expected;
  beforeEach(() => {
    arr = [
      [1, 5, 8],
      [4, 7, 2],
      [3, 9, 6]
    ];
    expected = [
      [1, 4, 3],
      [5, 7, 9],
      [8, 2, 6]
    ];
  });

  it('should transpose a 3x3 matrix', function () {
      expect(transpose(arr)).toEqual(expected);
      expect(arr).toEqual(arr);
  });
});