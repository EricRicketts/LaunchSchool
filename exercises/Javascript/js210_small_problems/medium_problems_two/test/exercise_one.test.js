import {letterPercentages } from "../code/letter_percentages";

describe('JS210 Small Problems Medium Two Exercise One', function () {
  let str, expected;
  it('should classify lower case, upper case, spaces and numbers', function () {
    str = 'abCdef 123';
    expected = { lowercase: "50.00", uppercase: "10.00", neither: "40.00" };
    expect(letterPercentages(str)).toEqual(expected);
  });

  it('should classify lower case, upper case, spaces and non-alphanumeric characters', function () {
    str = 'AbCd +Ef';
    expected = { lowercase: "37.50", uppercase: "37.50", neither: "25.00" };
    expect(letterPercentages(str)).toEqual(expected);
  });

  it('should classify input with no letters', function () {
    str = '123';
    expected = { lowercase: "0.00", uppercase: "0.00", neither: "100.00" };
    expect(letterPercentages(str)).toEqual(expected);
  });
});