describe('Repeating Strings', function () {
  it('repeat a string with a string is undefined', function (done) {
    expect(repeat('abc', 'a')).to.be.undefined;
    done();
  });

  it('repeat a string with a boolean is undefined', function (done) {
    expect(repeat('abc', false)).to.be.undefined;
    done();

  });  it('repeat a string with null is undefined', function (done) {
    expect(repeat('abc', null)).to.be.undefined;
    done();
  });

  it('repeat a string with an empty string is undefined', function (done) {
    expect(repeat('abc', '  ')).to.be.undefined;
    done();
  });

  it('repeat a string with a negative number is undefined', function (done) {
    expect(repeat('abc', -1)).to.be.undefined;
    done();
  });

  it('repeat a string with infinity is undefined', function (done) {
    expect(repeat('abc', Infinity)).to.be.undefined;
    done();
  });

  it('repeat a string with a negative infinity is undefined', function (done) {
    expect(repeat('abc', -Infinity)).to.be.undefined;
    done();
  });

  it('repeat a string with a NaN is undefined', function (done) {
    expect(repeat('abc', NaN)).to.be.undefined;
    done();
  });

  it('repeat a string one time', function (done) {
    expect(repeat('abc', 1)).to.equal('abc');
    done();
  });

  it('repeat a string two times', function (done) {
    expect(repeat('abc', 2)).to.equal('abcabc');
    done();
  });
});