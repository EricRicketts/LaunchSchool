import { includesFalse, includesFalseFix } from "../code/includes_false";

describe('Exercises JS210 Javascript Language Fundamentals Debugging Exercise Two', function () {
  let firstList, secondList, thirdList;
  beforeEach(() => {
    firstList = [8, null, 'abc', true, 'launch', 11, false];
    secondList = ['programming', undefined, 37, 64, true, 'false'];
    thirdList = [9422, 'lambda', true, 0, '54', null];
  });
  it('original code incorrectly identifies a value that is not boolean false', function () {
    expect(includesFalse(firstList)).toBe(true);
    expect(includesFalse(secondList)).toBe(false);
    expect(includesFalse(thirdList)).toBe(true); // this should be false
  });

  it('fixed code correctly identifies a boolean false only value', function () {
    expect(includesFalseFix(firstList)).toBe(true);
    expect(includesFalseFix(secondList)).toBe(false);
    expect(includesFalseFix(thirdList)).toBe(false);
  });

});