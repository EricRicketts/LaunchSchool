import { interleave } from "../code/combine_lists";

describe('Exercises JS210 Small Problems Easy Four Exercise Five', function () {
  it('combines two arrays by interleaving them', function () {
    var expected = [1, 'a', 2, 'b', 3, 'c', 4, 'd'];
    var arr1 = [1, 2, 3, 4];
    var arr2 = ['a', 'b', 'c', 'd'];
    expect(interleave(arr1, arr2)).toEqual(expected);
  });
});