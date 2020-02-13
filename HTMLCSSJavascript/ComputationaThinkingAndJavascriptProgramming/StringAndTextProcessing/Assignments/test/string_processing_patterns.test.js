import { capitalize, countWordInText } from "../code/string_processing_patterns";

describe('LS215 String And Text Processing String Processing Patterns', function () {
  let text, expected;
  it('should capitalize words', function () {
    text = 'the quick brown fox jumps over the lazy dog.';
    expected = 'The Quick Brown Fox Jumps Over The Lazy Dog.';
    expect(capitalize(text)).toBe(expected);
  });

  it('should count words', function () {
    text = 'the quick brown fox jumps over the lazy dog.';
    expect(countWordInText('the', text)).toBe(2);
    expect(countWordInText('dog', text)).toBe(1);
  });
});