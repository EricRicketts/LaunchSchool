import { retire } from '../code/retire';

describe('Exercises JS210 Small Problems Easy Three Exercise Three', function () {
  it('gives year of retirement and how many years to go', function () {
    var result = retire(30, 70);
    var currentDate = new Date();
    var currentYear = currentDate.getUTCFullYear();
    var retirementYear = currentYear + 40;
    var firstPhrase = "It is " + currentYear + "." + "  You will retire in " + retirementYear + ".\n";
    var secondPhrase = "You only have 40 years of work to go!";
    var expected = firstPhrase + secondPhrase;

    expect(result).toBe(expected);
  });
});