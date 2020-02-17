describe('LS215 Computational Thinking And Problem Solving Reverse A String', function () {
  let reverse, expected;
  beforeEach(() => {
    reverse = function(str) {
      return str.split('').reverse().join('');
    }
  });

  it('should reverse a single word', function () {
    expected = 'olleh';
    expect(reverse('hello')).toBe(expected);
  });

  it('should reverse an entire phrase', function () {
    expected = 'xof nworb kciuq ehT';
    expect(reverse('The quick brown fox')).toBe(expected);
  });
});