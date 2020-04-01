import { merge } from "../code/merge_sorted_lists";

describe('JS210 Small Problems Advanced One Exercise Five', function () {
  let arr1, arr2, expected;
  it('should merge two sorted lists of equal size', function () {
    arr1 = [1, 5, 9];
    arr2 = [2, 6, 8];
    expected = [1, 2, 5, 6, 8, 9];
    expect(merge(arr1, arr2)).toEqual(expected);
  });

  it('should merge two sorted lists of differing lengths', function () {
    arr1 = [1, 1, 3];
    arr2 = [2, 2];
    expected = [1, 1, 2, 2, 3];
    expect(merge(arr1, arr2)).toEqual(expected);
  });

  it('should merge properly if the first list is empty', function () {
    arr1 = [];
    arr2 = [1, 4, 5];
    expect(merge(arr1, arr2)).toEqual(arr2);
  });

  it('should merge properly if the second list is empty', function () {
    arr1 = [1, 4, 5];
    arr2 = [];
    expect(merge(arr1, arr2)).toEqual(arr1);
  });

  it('should merge two single element lists', function () {
    arr1 = [1];
    arr2 = [2];
    expected = [1, 2];
    expect(merge(arr1, arr2)).toEqual(expected);
  });

  it('should merge two single element lists if the second list is smaller', function () {
    arr1 = [2];
    arr2 = [1];
    expected = [1, 2];
    expect(merge(arr1, arr2)).toEqual(expected);
  });

  it('should merge two lists if more of the smaller items are in the second list', function () {
    arr1 = [4, 7, 9];
    arr2 = [1, 1, 2, 5, 8];
    expected = [1, 1, 2, 4, 5, 7, 8, 9];
    expect(merge(arr1, arr2)).toEqual(expected);
  });
});