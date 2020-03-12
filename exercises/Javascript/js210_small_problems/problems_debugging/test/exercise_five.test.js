import { rangeFix } from '../code/range';

describe('JS210 Small Problems Debugging Exercise Five', function () {
  it('should make a range from 0 to 5', function () {
    expect(rangeFix(5)).toEqual([0, 1, 2, 3, 4, 5]);
  });

  it('should make a range from 10 to 20', function () {
    expect(rangeFix(20, 10)).toEqual([10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]);
  });
});