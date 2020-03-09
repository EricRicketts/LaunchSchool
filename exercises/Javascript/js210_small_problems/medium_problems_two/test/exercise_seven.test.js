import { bubbleSort } from "../code/bubble_sort";

describe('JS210 Small Problems Medium Two Exercise Seven', function () {
  let arr, expected;
  it('should sort a two element array', function () {
    arr = [5, 3];
    expected = [3, 5];
    expect(bubbleSort(arr)).toEqual(expected);
  });

  it('should sort a five element array of numbers', function () {
    arr = [6, 2, 7, 1, 4];
    expected = [1, 2, 4, 6, 7];
    expect(bubbleSort(arr)).toEqual(expected);
  });

  it('should sort a seven element array of names', function () {
    arr = ['Sue', 'Pete', 'Alice', 'Tyler', 'Rachel', 'Kim', 'Bonnie'];
    expected = ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"];
    expect(bubbleSort(arr)).toEqual(expected);
  });
});