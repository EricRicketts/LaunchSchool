import { timeOfDayWithDate, timeOfDayWithoutDate } from "../code/time_of_day.js";

describe("Exercises: Javascript Langauge Fundamentals: Objects: Exercise Nine", () => {
  var results, expected, input;

  beforeEach(() => {
    results = [];
    input = [
      0, -3, 35, -1437, 3000,
      800, -4231
    ];
    expected = [
      "00:00", "23:57", "00:35", "00:03",
      "02:00", "13:20", "01:29"
    ];
  });
  it('original code converts to time of day', () => {
    input.forEach((num) => {
      results.push(timeOfDayWithoutDate((num)))
    });
    expect(results).toEqual(expected);
  });

  it('new code with Date object converts to time of day', function () {
    input.forEach((num) => {
      results.push(timeOfDayWithDate(num))
    });
    expect(results).toEqual(expected);
  });
});