import { mergeSort } from "../code/merge_sort";

describe('JS210 Small Problems Advanced One Exercise Six', function () {
  let arr, expected;
  it('should sort a four element list', function () {
    arr = [9, 5, 7, 1];
    expected = [1, 5, 7, 9];
    expect(mergeSort(arr)).toEqual(expected);
  });

  it('should sort a five element list', function () {
    arr = [6, 2, 7, 1, 4];
    expected = [1, 2, 4, 6, 7];
    expect(mergeSort(arr)).toEqual(expected);
  });

  it('should sort two numbers', function () {
    arr = [5, 3];
    expected = [3, 5];
    expect(mergeSort(arr)).toEqual(expected);
  });

  it('should sort a much larger list', function () {
    arr = [7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46];
    expected = [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54];
    expect(mergeSort(arr)).toEqual(expected);
  });

  it('should sort words', function () {
    arr = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
    expected = ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"];
    expect(mergeSort(arr)).toEqual(expected);
  });

  it('should sort a one element list', function () {
    expect(mergeSort([1])).toEqual([1]);
  });
});