import { reverseSentence } from "../code/reverse_it_part_one";

describe('Exercises JS210 Small Problems Easy Five Exercise Nine', function () {
  it('reversing an empty string returns an empty string', function () {
    expect(reverseSentence('')).toBe('');
  });

  it('reverses two words', function () {
    expect(reverseSentence('Hello World')).toBe('World Hello')
  });

  it('reverses more than two words', function () {
    expect(reverseSentence('Reverse these words')).toBe('words these Reverse');
  });
});