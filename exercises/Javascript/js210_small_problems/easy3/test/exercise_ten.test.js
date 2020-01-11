import { wordSizesPartTwo } from "../code/letter_counter";

describe('Exercises JS210 Javascript Language Fundamentals Easy Three Exercise Nine', function () {
  var expected;
  it('counts number of occurrences of word lengths', function () {
    expected = { "3": 1, "4": 1, "5": 2 };
    expect(wordSizesPartTwo('Four score and seven.')).toEqual(expected);
  });

  it('non-space characters are counted', function () {
    expected = { "3": 5, "6": 3 };
    expect(wordSizesPartTwo('Hey diddle diddle, the cat and the fiddle!')).toEqual(expected);
  });

  it('non-space characters include single quotes', function () {
    expected = { "5": 1, "2": 1, "3": 1 };
    expect(wordSizesPartTwo("What's up doc?")).toEqual(expected);
  });

  it('empty string returns empty object', function () {
    expect(wordSizesPartTwo('')).toEqual({});
  });
});