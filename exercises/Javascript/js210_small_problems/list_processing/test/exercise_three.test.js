import { multiplyAllPairs } from "../code/multiply_all_pairs";

describe('Exercises JS210 Small Problems List Processing Exercise Three', function () {
  let arr1, arr2, expected;
  it('multiply all pairs on two two element arrays', function () {
    arr1 = [1, 2];
    arr2 = [3, 4];
    expected = [3, 4, 6, 8];
    expect(multiplyAllPairs(arr1, arr2)).toEqual(expected);
  });

  it('works on the Launch School provided data', function () {
    arr1 = [2, 4];
    arr2 = [4, 3, 1, 2];
    expected = [2, 4, 4, 6, 8, 8, 12, 16];
    expect(multiplyAllPairs(arr1, arr2)).toEqual(expected);
  });
});