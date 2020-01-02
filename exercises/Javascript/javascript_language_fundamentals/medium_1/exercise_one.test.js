describe('Exercsies: JS210: Javascript Language Fundamentals: Medium 1: Exercise One', function () {
  it('&& returns false if first operand is boolean false', function () {
    expect(false && undefined).toBe(false);
  });

  it('|| returns second operand if the first is boolean false', function () {
    expect(false || undefined).toBeUndefined();
  });

  it('|| conditions hold for compound boolean statements && with ||', function () {
    expect((false && undefined) || (false || undefined)).toBeUndefined();
  });

  it('|| conditions hold for compound boolean statements || with &&', function () {
    expect((false || undefined) || (false && undefined)).toBe(false);
  });

  it('&& conditions hold for compound boolean statements && with ||', function () {
    expect((false && undefined) && (false || undefined)).toBe(false);
  });

  it('&& conditions hold for compound boolean statements || with &&', function () {
    expect((false || undefined) && (false && undefined)).toBeUndefined();
  });

  it('|| returns first operand if it coerces to true', function () {
    expect('a' || (false && undefined) || '').toBe('a');
  });

  it('|| returns first true coerced operand even if not very first operand', function () {
    expect((false && undefined) || 'a' || '').toBe('a');
  });

  it('&& returns first operand which can be coerced to false', function () {
    expect('a' && (false || undefined) && '').toBeUndefined();
  });

  it('&& short circuits if anyone of the operands is coerced to false', function () {
    expect((false || undefined) && 'a' && '').toBeUndefined();
  });
});