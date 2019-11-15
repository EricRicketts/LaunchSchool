describe('Converting Strings To Lower Case', function () {
  it('converts "ALPHABET" to "alphabet"', function (done) {
    expect(toLowerCase('ALPHABET')).to.equal('alphabet');
    done();
  });

  it('converts "123" to "123"', function (done) {
    expect(toLowerCase('123')).to.equal('123');
    done();
  });

  it('converts "abcDEF" to "abcdef"', function (done) {
    expect(toLowerCase('abcDEF')).to.equal('abcdef');
    done();
  });  
});