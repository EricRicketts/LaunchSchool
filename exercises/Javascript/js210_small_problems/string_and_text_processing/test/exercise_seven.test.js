import { staggeredCase } from "../code/staggered_caps_part_two";

describe('Exercises JS210 String And Text Processing Exercise Seven', function () {
  let str, expected;

  it('should stagger case for a string of letters and spaces', function () {
     str = 'I Love Launch School!';
     expected = 'I lOvE lAuNcH sChOoL!';
     expect(staggeredCase(str)).toBe(expected);
  });

  it('should stagger case for a string of capital letters and spaces', function () {
    str = 'ALL CAPS';
    expected = 'AlL cApS';
    expect(staggeredCase(str)).toBe(expected);
  });

  it('should stagger case for a string of letters, numbers and spaces', function () {
    str = 'ignore 77 the 444 numbers';
    expected = 'IgNoRe 77 ThE 444 nUmBeRs';
    expect(staggeredCase(str)).toBe(expected);
  });
});