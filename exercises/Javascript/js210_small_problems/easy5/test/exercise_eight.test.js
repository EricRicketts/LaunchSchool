import { sequence } from "../code/sequence_count";

describe('Exercises JS210 Small Problems Easy Five Exercise Eight', function () {
  var expected;
  it('returns a sequence which increments by one', function () {
    expected = [1, 2, 3, 4, 5];
    expect(sequence(5, 1)).toEqual(expected);
  });

  it('returns a sequence which increments by negative seven', function () {
    expected = [-7, -14, -21, -28];
    expect(sequence(4, -7)).toEqual(expected);
  });

  it('returns a sequence of zeros if zero is incrementer', function () {
    expected = [0, 0, 0];
    expect(sequence(3, 0)).toEqual(expected);
  });

  it('returns an empty array if there are zero iterations', function () {
    expect(sequence(0, 1000000)).toEqual([]);
  });
});