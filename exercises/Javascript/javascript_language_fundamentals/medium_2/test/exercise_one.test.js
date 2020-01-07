import { processOrder, wrongProcessOrderOne, wrongProcessOrderTwo } from '../code/process_order.js';

describe('Exercises: Javascript Language Fundamentals: Medium 2: Exercise One', function () {
  var result, expected;
  it('In checking for falsy values remember 0 is a falsy value', function () {
    var res1 = wrongProcessOrderOne(100, 0, 0, 0, 0);
    var res2 = wrongProcessOrderTwo(100, 0, 0, 0, 0);
    result = [res1, res2];
    expected = [126.5, 126.5];

    expect(result).toEqual(expected);
  });

  it('falsy values corrected, 0 can be an argument', function () {
    result = processOrder(100, 0, 0, 0, 0);
    expect(result).toBe(0);
  });
});