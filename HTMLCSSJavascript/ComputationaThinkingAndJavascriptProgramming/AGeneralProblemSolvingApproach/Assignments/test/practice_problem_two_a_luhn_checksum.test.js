import { luhnCheckSumNumber } from "../code/luhn_checksum";

describe('LS215 A General Problem Solving Approach Problem Two Luhn Checksum Number', function () {
  it('should find the tenth checksum digit for a nine digit number', function () {
    expect(luhnCheckSumNumber('544275712')).toBe('5');
 });

  it('should find the twentieth checksum digit for a nineteen digit number', function () {
    expect(luhnCheckSumNumber('3554908207972339718')).toBe('8');
  });
});
