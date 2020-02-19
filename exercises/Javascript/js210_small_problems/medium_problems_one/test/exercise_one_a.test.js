import { rotateArray } from "../code/rotation_part_one_a";

describe('My own variation on JS210 Small Problems Medium One Exercise One', function () {
  let array, expected;
  beforeEach(() => {
    array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  });

  it('should rotate by one position by default and leaves original array intact', function () {
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
    expect(rotateArray(array)).toEqual(expected);
    expect(array).toBe(array);
  });

  it('should rotate an array by two positions', function () {
    expected = [2, 3, 4, 5, 6, 7, 8, 9, 0, 1];
    expect(rotateArray(array, 2)).toEqual(expected);
  });

  it('should rotate an array by five positions', function () {
    expected = [5, 6, 7, 8, 9, 0, 1, 2, 3, 4];
    expect(rotateArray(array, 5)).toEqual(expected);
  });

  it('should rotate by length of array returns original array', function () {
    expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
    expect(rotateArray(array, 10)).toEqual(expected);
  });
});