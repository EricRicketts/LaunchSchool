import { anagram } from "../code/anagrams";

describe('LS215 List Processing And Functional Abstractions Practice Problem Four', function () {
  let word, listOne, listTwo, expected;
  beforeEach(() => {
    word = 'listen';
    listOne = ['enlists', 'google', 'inlets', 'banana'];
    listTwo = ['enlist', 'google', 'inlets', 'banana'];
  });

  it('should match one word from the first list', function () {
    expected = ['inlets'];
    expect(anagram(word, listOne)).toEqual(expected);
  });

  it('should match two words from the second list', function () {
    expected = ['enlist', 'inlets'];
    expect(anagram(word, listTwo)).toEqual(expected);
  });
});