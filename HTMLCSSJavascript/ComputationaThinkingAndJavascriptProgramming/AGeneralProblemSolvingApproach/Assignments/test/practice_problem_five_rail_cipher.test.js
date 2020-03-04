import { encodeUsingRailCipher } from "../code/rail_cipher";

describe('LS215 A General Problem Solving Approach Practice Problem Five Rail Cipher', function () {
  let str, expected;

  it('should encode a 2 rail cipher message', function () {
    str = 'XOXOXOXO';
    expected = 'XXXXOOOO';
    expect(encodeUsingRailCipher(str, 2)).toBe(expected);
  });

  it('should encode a three rail cipher message', function () {
    str = 'WEAREDISCOVEREDFLEEATONCE';
    expected = 'WECRLTEERDSOEEFEAOCAIVDEN';
    expect(encodeUsingRailCipher(str, 3)).toBe(expected);
  });

  it('should encode a four rail cipher message', function () {
    str = 'EXERCISES';
    expected = 'ESXIEECSR';
    expect(encodeUsingRailCipher(str, 4)).toBe(expected);
  });

  it('should encode a five rail cipher message', function () {
    str = 'ABCDEFGHIJKLM';
    expected = 'AIBHJCGKDFLEM';
    expect(encodeUsingRailCipher(str, 5)).toBe(expected);
  });

  it('should return the original message with one rail', function () {
    str = 'One rail, only one rail';
    expected = 'One rail, only one rail';
    expect(encodeUsingRailCipher(str, 1)).toBe(expected);
  });

  it('should return the original message if there are more rails than letters', function () {
    str = 'More rails than letters';
    expected = 'More rails than letters';
    expect(encodeUsingRailCipher(str, 24)).toBe(expected);
  });

  it('should return an empty string for an empty string input', function () {
    str = '';
    expected = '';
    expect(encodeUsingRailCipher(str, 3)).toBe(expected);
  });
});