import { countOccurrences } from "../code/how_many";

describe('Exercises JS210 Small Problems Easy Four Exercise Eight', function () {
  it('counts occurrences of items in array', function () {
    var arr = [
      'car', 'car', 'truck', 'car', 'SUV', 'truck',
      'motorcycle', 'motorcycle', 'car', 'truck'
    ];
    var expected = {
      car: 4, truck: 3, SUV: 1, motorcycle: 2,
    }

    expect(countOccurrences(arr)).toEqual(expected);
  });
});