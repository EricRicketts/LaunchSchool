import { afterMidnightWithoutDate, beforeMidnightWithoutDate,
  afterMidnightWithDate, beforeMidnightWithDate } from '../code/after_before_midnight.js';

describe('Exercises: Javascript Language Fundamentals: Objects: Exercise Ten', function () {
  var input, results, expected;

  beforeEach(() => {
    results = [];
    input = ['00:00', '00:00', '12:34', '12:34'];
    expected = [0, 0, 754, 686];
  });

  it('original function converts time of day to minutes', function () {
    input.forEach((timeOfDay, index) => {
      if (index % 2 === 0) {
        results.push(afterMidnightWithoutDate(timeOfDay));
      } else {
        results.push(beforeMidnightWithoutDate(timeOfDay));
      }
    });
    expect(results).toEqual(expected);
  });

  it('new function with Date converts time of day to minutes', function () {
    input.forEach((timeOfDay, index) => {
      if (index % 2 === 0) {
        results.push(afterMidnightWithDate(timeOfDay));
      } else {
        results.push(beforeMidnightWithDate(timeOfDay));
      }
    });
    expect(results).toEqual(expected);
  });
});