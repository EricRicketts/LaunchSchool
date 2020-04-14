import { star } from "../code/seeing_stars";

let starFive, starSeven, starNine;
beforeEach(() => {
starFive = `
* * *
 *** 
*****
 *** 
* * *
`.trimStart();

starSeven = `
*  *  *
 * * * 
  ***  
*******
  ***  
 * * * 
*  *  *
`.trimStart();

starNine = `
*   *   *
 *  *  * 
  * * *  
   ***   
*********
   ***   
  * * *  
 *  *  * 
*   *   *
`.trimStart();
});

describe('JS210 Small Problems Interpretive Problem Solving Exercise Six', function () {
  it('should make an 8 pointed star in a 5x5 grid', function () {
    expect(star(5)).toBe(starFive);
  });

  it('should make an 8 pointed star in a 7x7 grid', function () {
    expect(star(7)).toBe(starSeven);
  });

  it('should make an 8 pointed star in a 9x9 grid', function () {
    expect(star(9)).toBe(starNine);
  });

  it('should throw an error if the grid is 3 or less', function () {
    expect(() => { star(3) }).toThrow(RangeError);
  });

  it('should throw an error if the grid is even', function () {
    expect(() => { star(6) }).toThrow('The argument must be odd and greater than 3.');
  });
});