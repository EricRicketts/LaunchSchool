import{ runningTotal, runningTotalMap } from "../code/running_total";

describe('Exercises JS210 Javascript Langauge Fundamentals Easy Three Exercise Seven', function () {
  it('running total on three element array', function () {
    expect(runningTotal([2, 5, 13])).toEqual([2, 7, 20]);
    expect(runningTotalMap([2, 5, 13])).toEqual([2, 7, 20]);
  });

  it('running total on five element array', function () {
    expect(runningTotal([14, 11, 7, 15, 20])).toEqual([14, 25, 32, 47, 67]);
    expect(runningTotalMap([14, 11, 7, 15, 20])).toEqual([14, 25, 32, 47, 67]);
  });

  it('should return a one element array as the answer', function () {
    expect(runningTotal([3])).toEqual([3]);
    expect(runningTotalMap([3])).toEqual([3]);
  });

  it('should return an empty array with empty array input', function () {
    expect(runningTotal([])).toEqual([]);
    expect(runningTotalMap([])).toEqual([]);
  });
});