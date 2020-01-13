import { multiplyList } from "../code/multiply_list";

describe('Exercises JS210 Small Problems Easy Four Exercise Seven', function () {
  it('produces a new array which is the product of each element of the two input arrays', function () {
    var arr1 = [3, 5, 7];
    var arr2 = [9, 10, 11];
    var expected = [27, 50, 77];

    expect(multiplyList(arr1, arr2)).toEqual(expected);
  });
});