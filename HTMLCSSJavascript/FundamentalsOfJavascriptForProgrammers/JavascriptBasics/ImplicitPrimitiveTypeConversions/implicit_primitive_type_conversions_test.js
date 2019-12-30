describe('implicity primitive type conversions', function () {
  it('Number function and unary plus operator on a numeric string', function () {
    expect(Number('123')).to.equal(123);
    expect(+('123')).to.equal(123);
  });

  it('Number function and unary plus operator on true', function () {
    expect(Number(true)).to.equal(1);  
    expect(+(true)).to.equal(1);  
  });

  it('Number function and unary plus operator on false', function () {
    expect(Number(false)).to.equal(0);
    expect(+(false)).to.equal(0);
  });

  it('Number function and unary plus operator on an empty strng', function () {
    expect(Number('')).to.equal(0);
    expect(+('')).to.equal(0);
  });

  it('Number function and unary plus operator on a string of spaces', function () {
    expect(Number('  ')).to.equal(0);
    expect(+('  ')).to.equal(0);
  });

  it('Number function and unary plus operator on a control character', function () {
    expect(Number('\n')).to.equal(0);
    expect(+('\n')).to.equal(0);
  });

  it('Number function and unary plus operator on null', function () {
    expect(Number(null)).to.equal(0);
    expect(+(null)).to.equal(0);
  });

  it('Number function and unary plus operator on undefined', function () {
    expect(Number(undefined)).to.be.NaN;
    expect(+(undefined)).to.be.NaN;
  });

  it('Number function and unary plus operator on non-blank string of characters', function () {
    expect(Number('a')).to.be.NaN;
    expect(+('a')).to.be.NaN;
  });

  it('Number function and unary plus operator on non-black string of mixed numbers and characters', function () {
    expect(Number('1a')).to.be.NaN;
    expect(+('1a')).to.be.NaN;
  });
});