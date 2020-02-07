import { myForEach } from '../code/my_foreach';

describe('Iteration Lesson my own version of forEach', function () {
  let ary, min, max, getMin, getMinMax, expected;

  beforeEach(() => {
    ary = [4, 5, 12, 23, 3];
    expected = [3, 23];
    min = Infinity;
    max = -Infinity;
    getMin = function(value) {
      min = value < min ? value : min;
    };

    getMinMax = function(value) {
      if (value >= max) {
        max = value;
      }

      if (value <= min) {
        min = value;
      }
    };
  });

  it('standard forEach should work for finding minimum value', function () {
    ary.forEach(getMin);
    expect(min).toBe(3);
  });

  it('standard forEach should work for finding minimum and maximum values', function () {
    ary.forEach(getMinMax);
    expect([min, max]).toEqual(expected);
  });

  it('my own version of forEach should find the minimum value of an array', function () {
    myForEach(ary, getMin);
    expect(min).toBe(3);
  });

  it('my own version of forEach should find both the minimum and maximum value for an array', function () {
    myForEach(ary, getMinMax);
    expect([min, max]).toEqual(expected);
  });
});