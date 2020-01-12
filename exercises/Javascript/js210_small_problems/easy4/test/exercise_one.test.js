import { dms } from "../code/cute_angles";

describe('Exercises JS210 Javascript Language Fundamentals Easy Four Exercise One', function () {
  var expected;
  const degreeSymbol = String.fromCharCode(176);
  it('returns degrees minutes seconds for a whole number', function () {
    expected = '30' + degreeSymbol + "00'" + '00"';
    expect(dms(30)).toBe(expected);
  });

  it('degrees minutes seconds under 90 degrees', function () {
    expected = '76' + degreeSymbol + "43'" + '48"';
    expect(dms(76.73)).toBe(expected);
  });

  it('degrees between 180 and 270', function () {
    expected = '254' + degreeSymbol + "35'" + '59"';
    expect(dms(254.6)).toBe(expected);
  });

  it('degrees between 90 and 180', function () {
    expected = '93' + degreeSymbol + "02'" + '05"';
    expect(dms(93.034773)).toBe(expected);
  });

  it('handles 0 degrees', function () {
    expected = '0' + degreeSymbol + "00'" + '00"';
    expect(dms(0)).toBe(expected);
  });

  it('handles 360 degrees', function () {
    expected = '0' + degreeSymbol + "00'" + '00"';
    expect(dms(360)).toBe(expected);
  });
});