import { sequence } from "../code/counting_up";

describe('Exercises JS210 Small Problems Easy Five Exercise Six', function () {
  var expected;
  it('produces a sequence of five numbers', function () {
    expected = [1, 2, 3, 4, 5];
    expect(sequence(5)).toEqual(expected);
  });

  it('produces a sequence of three numbers', function () {
    expected = [1, 2, 3];
    expect(sequence(3)).toEqual(expected);
  });

  it('produces a sequence of one number', function () {
    expected = [1];
    expect(sequence(1)).toEqual(expected);
  });
});