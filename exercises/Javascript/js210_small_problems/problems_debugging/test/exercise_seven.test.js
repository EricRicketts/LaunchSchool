import { valenceOfMolecule, valenceOfMoleculeFix } from "../code/molecules";

describe('JS210 Small Problems Debugging Exercise Seven', function () {
  it('should throw a TypeError using the original function', function () {
    expect(() => { valenceOfMolecule('H2', 'O') }).toThrow(TypeError);
  });

  it('should return the number of valence electrons with the corrected function', function () {
    expect(valenceOfMoleculeFix('H2', 'O')).toBe(8);
  });
});