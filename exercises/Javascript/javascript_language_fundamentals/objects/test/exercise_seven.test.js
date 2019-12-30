describe('Exercises: Javascript Language Fundamentals: Objects: Exercise Seven', () => {
  var calculateBonus, result, expected;

  beforeEach(() => {
    calculateBonus = function() {
      return arguments[1] ? arguments[0] / 2 : 0;
    }
  });

  it('return half salary if bonus enabled', () => {
    result = [calculateBonus(2800, true), calculateBonus(50000, true)];
    expected = [1400, 25000];
    expect(result).toEqual(expected);
  });

  it('return 0 if no salaray bonus', () => {
    expect(calculateBonus(1000, false)).toBe(0);
  });
});