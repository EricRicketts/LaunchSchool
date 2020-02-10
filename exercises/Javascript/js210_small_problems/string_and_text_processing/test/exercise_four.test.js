import { wordCap, wordCapAlternate, wordCapLaunchSchool } from "../code/capitalize_words";

describe('Exercises JS210 Small Problems String And Text Processing Exercise Four', function () {
  let str, expected;
  it('capitalizes all lowercase words', function () {
    str = 'four score and seven';
    expected = 'Four Score And Seven';
    expect(wordCap(str)).toBe(expected);
  });

  it('capitalizes words which have a mix of upper and lower case', function () {
    str = 'the javaScript language';
    expected = 'The Javascript Language';
    expect(wordCap(str)).toBe(expected);
  });

  it('ignores quoted words', function () {
    str = 'this is a "quoted" word';
    expected = 'This Is A "quoted" Word';
    expect(wordCap(str)).toBe(expected);
  });

  it('alternate capitalizes all lowercase words', function () {
    str = 'four score and seven';
    expected = 'Four Score And Seven';
    expect(wordCapAlternate(str)).toBe(expected);
  });

  it('alternate capitalizes words which have a mix of upper and lower case', function () {
    str = 'the javaScript language';
    expected = 'The Javascript Language';
    expect(wordCapAlternate(str)).toBe(expected);
  });

  it('alternate ignores quoted words', function () {
    str = 'this is a "quoted" word';
    expected = 'This Is A "quoted" Word';
    expect(wordCapAlternate(str)).toBe(expected);
  });

  it('Launch School capitalizes all lowercase words', function () {
    str = 'four score and seven';
    expected = 'Four Score And Seven';
    expect(wordCapLaunchSchool(str)).toBe(expected);
  });

  it('Launch School capitalizes words which have a mix of upper and lower case', function () {
    str = 'the javaScript language';
    expected = 'The Javascript Language';
    expect(wordCapLaunchSchool(str)).toBe(expected);
  });

  it('Launch School ignores quoted words', function () {
    str = 'this is a "quoted" word';
    expected = 'This Is A "quoted" Word';
    expect(wordCapLaunchSchool(str)).toBe(expected);
  });
});