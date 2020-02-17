import { acronym, acronymAlternate } from "../code/acronym";

describe('LS215 Computational Thinking And Problem Solving Acronym', function () {
  let expected, str;
  it('should make an acronym from words and spaces', function () {
    str = 'Portable Network Graphics';
    expected = 'PNG';

    expect(acronym(str)).toBe(expected);
  });

  it('should make an acronym from words, spaces and commas', function () {
    str = 'First In, First Out';
    expected = 'FIFO';

    expect(acronym(str)).toBe(expected);
  });

  it('should make an acronym from words, spaces and colons', function () {
    str = 'PHP: Hypertext Preprocessor';
    expected = 'PHP';

    expect(acronym(str)).toBe(expected);
  });

  it('should make an acronym from words, spaces and dashes', function () {
    str = 'Complementary metal-oxide semiconductor';
    expected = 'CMOS';

    expect(acronym(str)).toBe(expected);
  });

  it('should second example of acronym from words, spaces and dashes', function () {
    str = 'Hyper-text Markup Language';
    expected = 'HTML';

    expect(acronym(str)).toBe(expected);
  });

  it('should alternate make an acronym from words and spaces', function () {
    str = 'Portable Network Graphics';
    expected = 'PNG';

    expect(acronymAlternate(str)).toBe(expected);
  });

  it('should alternate make an acronymAlternate from words, spaces and commas', function () {
    str = 'First In, First Out';
    expected = 'FIFO';

    expect(acronymAlternate(str)).toBe(expected);
  });

  it('should alternate make an acronymAlternate from words, spaces and colons', function () {
    str = 'PHP: Hypertext Preprocessor';
    expected = 'PHP';

    expect(acronymAlternate(str)).toBe(expected);
  });

  it('should alternate make an acronymAlternate from words, spaces and dashes', function () {
    str = 'Complementary metal-oxide semiconductor';
    expected = 'CMOS';

    expect(acronymAlternate(str)).toBe(expected);
  });

  it('should alternate second example of acronymAlternate from words, spaces and dashes', function () {
    str = 'Hyper-text Markup Language';
    expected = 'HTML';

    expect(acronymAlternate(str)).toBe(expected);
  });
});