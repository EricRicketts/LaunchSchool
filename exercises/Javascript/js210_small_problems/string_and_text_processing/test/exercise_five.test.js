import { swapCase, swapCaseAlternate } from '../code/swap_case';
describe('Exercises JS210 Small Problems String And Text Processing Exercise Five', function () {
  let str, expected;
  it('should swap case on all letters', function () {
    str = 'CamelCase';
    expected = 'cAMELcASE';
    expect(swapCase(str)).toBe(expected);
  });

  it('should swap case on mix of letters and other characters', function () {
    str = 'Tonight on XYZ-TV';
    expected = 'tONIGHT ON xyz-tv';
    expect(swapCase(str)).toBe(expected);
  });

  it('Alternate should swap case on all letters', function () {
    str = 'CamelCase';
    expected = 'cAMELcASE';
    expect(swapCaseAlternate(str)).toBe(expected);
  });

  it('Alternate should swap case on mix of letters and other characters', function () {
    str = 'Tonight on XYZ-TV';
    expected = 'tONIGHT ON xyz-tv';
    expect(swapCaseAlternate(str)).toBe(expected);
  });
});