import { lightsOn } from "../code/thousand_lights";

describe('JS210 Small Problems Interpretive Problem Solving Exercise One', function () {
  let expected;
  it('should iterate through five lights', function () {
    expected = [1, 4];
    expect(lightsOn(5)).toEqual(expected);
  });

  it('should iterate through one hundred lights', function () {
    expected = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];
    expect(lightsOn(100)).toEqual(expected);
  });
});