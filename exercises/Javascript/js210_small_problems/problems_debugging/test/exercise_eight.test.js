import { targetRoll, targetRollFixed } from "../code/glory";

describe('JS210 Small Problems Debugging Exercise Eight', function () {
  let expected, input, myCharacter;
  beforeEach(() => {
    myCharacter = {
      name: 'Jenkins',
      strength: 4,
      constitution: 6,
      education: 11,
      luck: 3,
      sanity: 9,
    };
  });
  it('should incorrectly registers both automatic success and failure for a throw of 1', function () {
    input = [1, { min: 0, max: 0}, { min: 0, max: 0}, true, false];
    expected = ['--> 1', 'Meagre attempt. Your character fails miserably.',
      'Your character succeeds without effort. Glory!', 'Your character succeeds.'];
    expect(targetRoll(...input)).toEqual(expected);
  });

  it('should incorrectly registers both automatic success and success for a throw of 20', function () {
    input = [20, { min: 0, max: 0}, { min: 0, max: 0}, false, true];
    expected = ['--> 20', 'Your character succeeds without effort. Glory!', 'Your character succeeds.'];
    expect(targetRoll(...input)).toEqual(expected);
  });

  it('should correctly register meagre attempt when resolving to 1', function () {
    input = [1, { min: 0, max: 0}, { min: 0, max: 0}, true, false];
    expected = ['--> 1', 'Meagre attempt. Your character fails miserably.'];
    expect(targetRollFixed(...input)).toEqual(expected);
  });

  it('should correctly register a glory when resolving to 20', function () {
    input = [20, { min: 0, max: 0}, { min: 0, max: 0}, false, true];
    expected = ['--> 20', 'Your character succeeds without effort. Glory!'];
    expect(targetRollFixed(...input)).toEqual(expected);
  });
});