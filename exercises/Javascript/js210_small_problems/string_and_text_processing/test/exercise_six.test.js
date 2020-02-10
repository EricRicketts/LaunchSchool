import { staggeredCase } from "../code/staggered_caps_part_one";

describe('Exercises JS210 Small Problems String And Text Processing Exercise Six', function () {
  let str, expected;
  it('should stagger all letters accounting for spaces and non letters', function () {
    str = 'I Love Launch School!';
    expected = 'I LoVe lAuNcH ScHoOl!';
    expect(staggeredCase((str))).toBe(expected);
  });

  it('should stagger all upcase letters', function () {
    str = 'ALL_CAPS';
    expected = 'AlL_CaPs';
    expect(staggeredCase((str))).toBe(expected);
  });

  it('should stagger all letters accounting for spaces and numbers', function () {
    str = 'ignore 77 the 444 numbers';
    expected = 'IgNoRe 77 ThE 444 NuMbErS';
    expect(staggeredCase((str))).toBe(expected);
  });
});