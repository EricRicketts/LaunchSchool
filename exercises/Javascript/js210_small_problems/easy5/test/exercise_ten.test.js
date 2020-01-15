import { reverseWords } from "../code/reverse_it_part_two";

describe('Exercises JS210 Small Problems Easy Five Exercise Ten', function () {
  it('reverses a single word more than five letters', function () {
    expect(reverseWords('Professional')).toBe('lanoisseforP');
  });

  it('only single words in a sentence if they are five characters or longer', function () {
    expect(reverseWords('Walk around the block')).toBe('Walk dnuora the kcolb');
  });

  it('reverses all words if each is five characters or longer', function () {
    expect(reverseWords('Launch School')).toBe('hcnuaL loohcS');
  });
});