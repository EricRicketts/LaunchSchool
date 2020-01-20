import { getSpooked, getSpookedFixed } from "../code/full_moon";

describe('Exercises JS210 Javascript Langauge Fundamentals Debugging Exercise Seven', function () {
  let species, isMidnight, isFullMoon, result, expected;
  beforeEach(() => {
    species = ['wolf', 'human', 'wasp', 'squirrel', 'weasel', 'dinosaur'];
    isFullMoon = true;
    isMidnight = true;
  });

  it('incorrectly logs each transformable creature twice', function () {
    result = getSpooked(species, isMidnight, isFullMoon);
    expected = [
      'Beware of the werewolf!',
      'Beware of the werewolf!',
      'Beware of the werewasp!',
      'Beware of the werewasp!',
      'Beware of the wereweasel!',
      'Beware of the wereweasel!'
    ];
    expect(result).toEqual(expected);
  });

  it('correctly logs each transformable creature once', function () {
    result = getSpookedFixed(species, isMidnight, isFullMoon);
    expected = [
      'Beware of the werewolf!',
      'Beware of the werewasp!',
      'Beware of the wereweasel!'
    ];
    expect(result).toEqual(expected);
  });
});