import { sumSquareDifference } from "../code/square_of_sums_minus_sum_of_squares";

describe('JS210 Small Problems Medium Two Exercise Six', function () {
  it('should have square of sums minus sum of squares for limit 3 to be 22', function () {
    expect(sumSquareDifference(3)).toBe(22);
  });

  it('should have square of sums minus sum of squares for limit 10 to be 2640', function () {
    expect(sumSquareDifference(10)).toBe(2640);
  });

  it('should have square of sums minus sum of squares for limit 1 should be 0', function () {
    expect(sumSquareDifference(1)).toBe(0);
  });

  it('should have square of sums minus sum of squares for limit 100 to be 25164150', function () {
    expect(sumSquareDifference(100)).toBe(25164150);
  });
});