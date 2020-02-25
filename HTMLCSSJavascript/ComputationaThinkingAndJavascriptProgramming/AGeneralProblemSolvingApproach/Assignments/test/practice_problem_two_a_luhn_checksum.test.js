import { luhnCheckSumNumber } from "../code/luhn_checksum";

describe('LS215 A General Problem Solving Approach Problem Two Luhn Checksum Number', function () {
  it('should return a valid number as is', function () {
    expect(luhnCheckSumNumber('737498368581845')).toBe('737498368581845');
  });
  it('should find the tenth checksum digit for a nine digit number', function () {
    expect(luhnCheckSumNumber('834303980')).toBe('8343039809');
 });

  it('should find the twentieth checksum digit for a nineteen digit number', function () {
    expect(luhnCheckSumNumber('3554908207972339718')).toBe('35549082079723397188');
  });
});
