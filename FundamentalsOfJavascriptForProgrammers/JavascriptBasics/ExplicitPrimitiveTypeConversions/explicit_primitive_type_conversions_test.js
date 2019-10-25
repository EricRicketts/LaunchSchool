describe('explicit primitive type conversions', function() {

  it('use Number to convert a string to a number', function () {
    expect(Number('1')).to.equal(1);
  });

  it('use parseInt to convert a string to a number', function () {
    expect(parseInt('123', 10)).to.equal(123);
  });

  it('use String to covnert a number to a string', function () {
    expect(String(12)).to.equal('12');
  });

  it('use toString to convert a number to a string', function () {
    expect((145).toString()).to.equal('145');
  });

  it('add number to empty string, not recommended', function () {
    expect(145 + '').to.equal('145');
  });

  it('use String to convert a boolean to a string', function () {
    expect(String(true)).to.equal('true');
  });

  it('use toString to convert a boolean to a string', function () {
    expect((false).toString()).to.equal('false');
  });

  it('use Boolean to coerce any primitive value to a boolean', function () {
    expect(Boolean(undefined)).to.be.false;
    expect(Boolean(145)).to.be.true;
  });

  it('use double negation to coerce any primitive to a boolean', function () {
    expect(!!(null)).to.be.false;
    expect(!!('foo')).to.be.true;
  });
});