import { swapName } from "../code/name_swapping";

describe('Exercises JS210 Small Problems Easy Five Exercise Seven', function () {
  it('swaps first and last names', function () {
    var expected = 'Roberts, Joe';
    expect(swapName('Joe Roberts')).toBe(expected);
  });
});