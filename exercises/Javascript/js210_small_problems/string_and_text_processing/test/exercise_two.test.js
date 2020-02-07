import { removeVowels } from "../code/delete_vowels";

describe('Exercises JS210 Small Problems String and Text Processing Exercise Two', function () {
  let strAry, expected;
  it('removes vowels from the lowercase alphabet', function () {
    strAry = ['abcdefghijklmnopqrstuvwxyz'];
    expected = ['bcdfghjklmnpqrstvwxyz'];
    expect(removeVowels(strAry)).toEqual(expected);
  });
});