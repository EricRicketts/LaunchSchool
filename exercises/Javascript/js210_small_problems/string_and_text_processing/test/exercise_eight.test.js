import { wordLengths, wordLengthsLaunchSchool } from "../code/how_long_are_you";

describe('Exercises JS210 String And Text Processing Exercise Eight', function () {
  let str, expected;
  it('should characters in three words', function () {
    str = 'cow sheep chicken';
    expected = ["cow 3", "sheep 5", "chicken 7"];
    expect(wordLengths(str)).toEqual(expected);
  });

  it('should characters in six words', function () {
    str = 'baseball hot dogs and apple pie';
    expected = ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"];
    expect(wordLengths(str)).toEqual(expected);
  });

  it('should characters in five words with punctuation', function () {
    str = "It ain't easy, is it?";
    expected = ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"];
    expect(wordLengths(str)).toEqual(expected);
  });

  it('should characters in one large word', function () {
    str = 'Supercalifragilisticexpialidocious';
    expected = ["Supercalifragilisticexpialidocious 34"];
    expect(wordLengths(str)).toEqual(expected);
  });

  it('should return an empty array for an empty string', function () {
    expect(wordLengths('')).toEqual([]);
  });

  it('should return an empty array for no argument', function () {
    expect(wordLengths()).toEqual([]);
  });

  it('Launch School should characters in three words', function () {
    str = 'cow sheep chicken';
    expected = ["cow 3", "sheep 5", "chicken 7"];
    expect(wordLengthsLaunchSchool(str)).toEqual(expected);
  });

  it('Launch School should characters in six words', function () {
    str = 'baseball hot dogs and apple pie';
    expected = ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"];
    expect(wordLengthsLaunchSchool(str)).toEqual(expected);
  });

  it('Launch School should characters in five words with punctuation', function () {
    str = "It ain't easy, is it?";
    expected = ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"];
    expect(wordLengthsLaunchSchool(str)).toEqual(expected);
  });

  it('Launch School should characters in one large word', function () {
    str = 'Supercalifragilisticexpialidocious';
    expected = ["Supercalifragilisticexpialidocious 34"];
    expect(wordLengthsLaunchSchool(str)).toEqual(expected);
  });

  it('Launch School should return an empty array for an empty string', function () {
    expect(wordLengthsLaunchSchool('')).toEqual([]);
  });

  it('Launch School should return an empty array for no argument', function () {
    expect(wordLengthsLaunchSchool()).toEqual([]);
  });
});