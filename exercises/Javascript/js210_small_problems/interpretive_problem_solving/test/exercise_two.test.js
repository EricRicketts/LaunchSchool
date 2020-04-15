import { diamond } from "../code/diamonds";

describe('JS210 Small Problems Interpretive Problem Solving Exercise Two', function () {
  let oneRow, threeRows, fiveRows, sevenRows, nineRows;
  beforeEach(() => {
    oneRow = '*\n';
    threeRows = `
 * 
***
 * 
`.slice(1);

    fiveRows = `
  *  
 *** 
*****
 *** 
  *  
`.slice(1);

    sevenRows = `
   *   
  ***  
 ***** 
*******
 ***** 
  ***  
   *   
`.slice(1);

    nineRows = `
    *    
   ***   
  *****  
 ******* 
*********
 ******* 
  *****  
   ***   
    *    
`.slice(1);
  });

  it('should make a one row diamond', function () {
    expect(diamond(1)).toBe(oneRow);
  });

  it('should make a three row diamond', function () {
    expect(diamond(3)).toBe(threeRows);
  });

  it('should make a five row diamond', function () {
    expect(diamond(5)).toBe(fiveRows);
  });

  it('should make a seven row diamond', function () {
    expect(diamond(7)).toBe(sevenRows);
  });

  it('should make a nine row diamond', function () {
    expect(diamond(9)).toBe(nineRows);
  });

  it('should throw a RangeError if even input', function () {
    expect(() => { diamond(4)}).toThrow(RangeError);
  });
});