import { isBlockWord, isBlockWordAlternate } from "../code/block_word";

describe('LS215 A General Problem Solving Approach Problem Three Block Word', function () {
  it('should reject an empty string', function () {
    expect(isBlockWord('')).toBe(false);
  });

  it('should reject any word with non alphabetic characters', function () {
    expect(isBlockWord('FO1D')).toBe(false);
  });

  it('should validate \'BATCH\' as a block word', function () {
    expect(isBlockWord('BATCH')).toBe(true);
  });

  it('should reject \'BUTCH\' as a block word', function () {
    expect(isBlockWord('BUTCH')).toBe(false);
  });

  it('should validate \'jest\' as a block word', function () {
    expect(isBlockWord('jest')).toBe(true);
  });

  it('should reject \'LENGTH\' as a block word', function () {
    expect(isBlockWord('LENGTH')).toBe(false);
  });

  it('should reject \'TRUST\' as a block word', function () {
    expect(isBlockWord('TRUST')).toBe(false);
  });

  it('alternate should reject an empty string', function () {
    expect(isBlockWordAlternate('')).toBe(false);
  });

  it('alternate should reject any word with non alphabetic characters', function () {
    expect(isBlockWordAlternate('FO1D')).toBe(false);
  });

  it('alternate should validate \'BATCH\' as a block word', function () {
    expect(isBlockWordAlternate('BATCH')).toBe(true);
  });

  it('alternate should reject \'BUTCH\' as a block word', function () {
    expect(isBlockWordAlternate('BUTCH')).toBe(false);
  });

  it('alternate should validate \'jest\' as a block word', function () {
    expect(isBlockWordAlternate('jest')).toBe(true);
  });

  it('alternate should reject \'LENGTH\' as a block word', function () {
    expect(isBlockWordAlternate('LENGTH')).toBe(false);
  });

  it('alternate should reject \'TRUST\' as a block word', function () {
    expect(isBlockWordAlternate('TRUST')).toBe(false);
  });
});