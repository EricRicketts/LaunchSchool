import { rotateArray } from "../code/rotation_part_one";

describe('JS210 Small Problems Medium One Exercise One', function () {
  let arr, expected;
  it('should produce a rotated output but leave the original untouched', function () {
    arr = [1, 2, 3, 4];
    expected = [2, 3, 4, 1];
    expect(rotateArray(arr)).toEqual(expected);
    expect(arr).toEqual([1, 2, 3, 4]);
  });

  it('should return undefined for empty arguments', function () {
    expect(rotateArray()).toBe(undefined);
  });

  it('should return undefined for non Array arguments', function () {
    expect(rotateArray(1, 'a', true)).toBe(undefined);
  });

  it('should rotate an array of strings', function () {
    arr = ['a', 'b', 'c'];
    expected = ['b', 'c', 'a'];
    expect(rotateArray(arr)).toEqual(expected);
  });

  it('should return a single element array as is', function () {
    arr = ['a'];
    expected = ['a'];
    expect(rotateArray(arr)).toEqual(expected);
  });

  it('should rotate an array of mixed data types', function () {
    arr = [{ a: 2 }, [1, 2], 3];
    expected = [[1, 2], 3, { a: 2 }];
    expect(rotateArray(arr)).toEqual(expected);
  });

  it('should leaven an empty array as is', function () {
    arr = [];
    expected = [];
    expect(rotateArray(arr)).toEqual(expected);
  });
});