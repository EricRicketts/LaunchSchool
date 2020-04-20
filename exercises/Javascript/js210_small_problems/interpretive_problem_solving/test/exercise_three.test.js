import { isBlockWord } from "../code/is_block_word";

describe('JS210 Interpretive Problem Solving Exercise Three', function () {
   let word;

  it('should flag "BATCH" as a block word', function () {
    expect(isBlockWord('BATCH')).toBe(true);
  });

  it('should not flag "BUTCH" as a block word', function () {
    expect(isBlockWord('BUTCH')).toBe(false);
  });

  it('should flag "jest" as a block word', function () {
    expect(isBlockWord('jest')).toBe(true);
  });

  it('should flag "floW" as a block word', function () {
    expect(isBlockWord('floW')).toBe(true);
  });

  it('should not flag "APPLE" as a block word', function () {
    expect(isBlockWord('APPLE')).toBe(false);
  });

  it('should not flag "apple" as a block word', function () {
    expect(isBlockWord('apple')).toBe(false);
  });

  it('should not flag "appLE" as a block word', function () {
    expect(isBlockWord('appLE')).toBe(false);
  });

  it('should not flag "Box" as a block word', function () {
    expect(isBlockWord('Box')).toBe(false);
  });
});