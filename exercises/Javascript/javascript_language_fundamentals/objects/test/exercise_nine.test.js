import { timeOfDayWithoutDate } from "../code/time_of_day.js";

describe("Exercises: Javascript Langauge Fundamentals: Objects: Exercise Nine", () => {
  it('converts to time of day', () => {
    expect(timeOfDayWithoutDate(35)).toBe('00:35');
  });
});