import { read, readFix, progressFix } from "../code/stuck_on_page_18";

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Ten', function () {
  it('current code results in a stack overflow', function () {
    expect(() => { read(); }).toThrowError(RangeError);
  });

  it('fix does not reset starting page', function () {
    readFix();
    let lastIndex = progressFix.length - 1;
    expect(progressFix[lastIndex - 1]).toMatch(/Made it to page 36\d{1}\./)
    expect(progressFix[lastIndex]).toBe('Done!');
  });
});