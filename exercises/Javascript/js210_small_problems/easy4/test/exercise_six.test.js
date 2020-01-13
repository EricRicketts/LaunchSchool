import { showMultiplicativeAverage } from "../code/multiplicative_average";

describe('Exercises JS210 Small Problems Easy Four Exercise Six', function () {
  var arr, expected;
  it('multiplicative average for two numbers', function () {
    arr = [3, 5];
    expected = '7.500';
    expect(showMultiplicativeAverage(arr)).toBe(expected);
  });

  it('multiplicative average for a larger array', function () {
    arr = [2, 5, 7, 11, 13, 17];
    expected = '28361.667';
    expect(showMultiplicativeAverage(arr)).toBe(expected);
  });
});