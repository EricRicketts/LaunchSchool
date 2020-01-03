import { getSelectedColumnsError, getSelectedColumns } from '../code/get_selected_columns.js';

describe('Exercises: JS210 Javascript Language Fundamentals: Medium 1: Exercise 4', function () {
  var results, expected, array1, array2;
  beforeEach(() => {
    results = [];
    array1 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    array2 = [[1, 2, 3], [1, 2, 3], [1, 2, 3]];
  });

  it('first version limits selection to the size of the second argument', function () {
    expected = [[[1]], [[1, 4], [3, 6]], [[2, 2], [3, 3]]];
    expect(getSelectedColumnsError(array1, [0])).toEqual(expected[0]);
    expect(getSelectedColumnsError(array1, [0, 2])).toEqual(expected[1]);
    expect(getSelectedColumnsError(array2, [1, 2])).toEqual(expected[2]);
  });

  it('corrected version size is length of each array in the first argument', function () {
    expected = [[[1, 4, 7]], [[1, 4, 7], [3, 6, 9]], [[2, 2, 2], [3, 3, 3]]];
    expect(getSelectedColumns(array1, [0])).toEqual(expected[0]);
    expect(getSelectedColumns(array1, [0, 2])).toEqual(expected[1]);
    expect(getSelectedColumns(array2, [1, 2])).toEqual(expected[2]);
  });
});