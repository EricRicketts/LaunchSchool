const fs = require('fs');
const path = require('path');
import { delayLog } from "../code/problems";

describe('Assignment Asynchronous Execution With Set Timeout', function () {
  let results, expected;
  beforeEach(() => {
    jest.useFakeTimers();
  });

  it('delayLog should take about 10 seconds', function () {
    expected = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    results = delayLog();
    expect(setTimeout).toHaveBeenCalledTimes(10);
    expect(setTimeout).toHaveBeenLastCalledWith(expect.any(Function), 10000);
    jest.advanceTimersByTime(10000);
    expect(results).toEqual(expected);
  });

  it('asynchronous operations finish depending on how long they take', function () {
    expected = ['Once', 'a', 'upon', 'time'];
    results = [];
    setTimeout(() => { results.push('Once'); }, 1000);
    setTimeout(() => { results.push('upon'); }, 3000);
    setTimeout(() => { results.push('a'); }, 2000);
    setTimeout(() => { results.push('time'); }, 4000);
    jest.advanceTimersByTime(4000);
    expect(results).toEqual(expected);
  });

  it('timers embedded in other timers run only after the outer timer has finished', function () {
    results = [];
    expected = ['g', 'f', 'd', 'z', 'n', 's', 'q'];
    let q = () => 'q'; let d = () => 'd'; let n = () => 'n'; let z = () => 'z'; let s = () => 's';
    let f = () => 'f'; let g = () => 'g';
    setTimeout(() => {
      setTimeout(() => {
        results.push(q());
      }, 15);

      results.push(d());

      setTimeout(() => {
        results.push(n());
      }, 5);

      results.push(z());
    }, 10)

    setTimeout(() => {
      results.push(s());
    }, 20);

    setTimeout(() => {
      results.push(f());
    });

    results.push(g());
    jest.advanceTimersByTime(25);
    expect(results).toEqual(expected);
  });

  it('callback invoked after n seconds', function () {
    let callback = jest.fn(() => 1);
    function afterNSeconds(callback, n) {
      setTimeout(() => {
        results = callback();
      }, n*1000);
    };
    afterNSeconds(callback, 2);
    jest.advanceTimersByTime(2000);
    expect(callback).toHaveBeenCalledTimes(1);
    expect(results).toBe(1);
  });
});