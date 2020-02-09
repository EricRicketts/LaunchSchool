import { removeVowels, removeVowelsLaunchSchool } from "../code/delete_vowels";

describe('Exercises JS210 Small Problems String and Text Processing Exercise Two', function () {
  let strAry, expected;
  it('removes vowels from the lowercase alphabet', function () {
    strAry = ['abcdefghijklmnopqrstuvwxyz'];
    expected = ['bcdfghjklmnpqrstvwxyz'];
    expect(removeVowels(strAry)).toEqual(expected);
  });

  it('replaces an vowels in each string with nothing', function () {
     strAry = ['green', 'YELLOW', 'black', 'white'];
     expected = ["grn", "YLLW", "blck", "wht"];
     expect(removeVowels(strAry)).toEqual(expected);
  });

  it('all vowels should return an empty string case insensitive', function () {
     strAry = ['ABC', 'AEIOU', 'XYZ'];
     expected = ["BC", "", "XYZ"];
     expect(removeVowels(strAry)).toEqual(expected);
  });

  it('Launch School version removes vowels from the lowercase alphabet', function () {
    strAry = ['abcdefghijklmnopqrstuvwxyz'];
    expected = ['bcdfghjklmnpqrstvwxyz'];
    expect(removeVowelsLaunchSchool(strAry)).toEqual(expected);
  });

  it('Launch School version replaces an vowels in each string with nothing', function () {
    strAry = ['green', 'YELLOW', 'black', 'white'];
    expected = ["grn", "YLLW", "blck", "wht"];
    expect(removeVowelsLaunchSchool(strAry)).toEqual(expected);
  });

  it('Launch School version all vowels should return an empty string case insensitive', function () {
    strAry = ['ABC', 'AEIOU', 'XYZ'];
    expected = ["BC", "", "XYZ"];
    expect(removeVowelsLaunchSchool(strAry)).toEqual(expected);
  });

});