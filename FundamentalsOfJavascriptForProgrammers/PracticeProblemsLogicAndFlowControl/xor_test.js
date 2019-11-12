describe('XOR function', function () {
  function isXor(first, second) {
    return (
      (Boolean(first) && !Boolean(second)) ||
      (!Boolean(first) && Boolean(second))
    );
  }

  it('false and true', function (done) {
    expect(isXor(false, true)).to.be.true;
    done();
  });

  it('true and false', function (done) {
    expect(isXor(true, false)).to.be.true;
    done();
  });

  it('false and false', function (done) {
    expect(isXor(false, false)).to.be.false;
    done();
  });

  it('true and true', function (done) {
    expect(isXor(true, true)).to.be.false;
    done();
  });

  it('false and number', function (done) {
    expect(isXor(false, 3)).to.be.true;
    done();
  });

  it('string and undefined', function (done) {
    expect(isXor('a', undefined)).to.be.true;
    done();
  });

  it('null and empty string', function (done) {
    expect(isXor(null, '')).to.be.false;
    done();
  });

  it('string and number', function (done) {
    expect(isXor('2', 23)).to.be.false;
    done();
  });
});