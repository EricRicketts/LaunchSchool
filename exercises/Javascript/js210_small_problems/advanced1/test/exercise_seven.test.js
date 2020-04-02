import { binarySearch } from "../code/binary_serach";

describe('JS210 Small Problems Advanced One Exercise Seven', function () {
  let arr, searchValue, expected;
  it('should find a value in the upper range of a number list', function () {
    arr = [1, 5, 7, 11, 23, 45, 65, 89, 102];
    searchValue = 89;
    expected = 7;
    expect(binarySearch(arr, searchValue)).toBe(7);
  });

  it('should find the last value in the number list', function () {
    arr = [1, 5, 7, 11, 23, 45, 65, 89, 102];
    searchValue = 102;
    expected = 8;
    expect(binarySearch(arr, searchValue)).toBe(8);
  });
});