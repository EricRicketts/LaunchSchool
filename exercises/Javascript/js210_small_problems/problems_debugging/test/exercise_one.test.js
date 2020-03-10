import { wordLadder, wordLadderFixed } from "../code/word_ladder";

describe('JS210 Small Problems Debugging Exercise One', function () {
  let arr, expected;
  beforeEach(() => {
    arr = ['head', 'heal', 'teal', 'tell', 'tall', 'tail'];
    expected = 'head-heal-teal-tell-tall-tail';
  });

  it('should throw a TypeError', function () {
    expect(() => { wordLadder(); }).toThrow(TypeError);
  });

  it('should have fixed the error', function () {
    expect(wordLadderFixed()).toBe(expected);
  });

});