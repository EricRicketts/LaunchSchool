describe('String Starts With', function () {
  var str = 'We put comprehension and mastery above all else';

  it('returns true for "We" search string', function (done) {
    expect(startsWith(str, 'We')).to.be.true;
    done();
  });

  it('returns true for "We put" search string', function (done) {
    expect(startsWith(str, 'We put')).to.be.true;
    done();
  });

  it('returns true for an empty search string', function (done) {
    expect(startsWith(str, '')).to.be.true;
    done();
  });

  it('returns false for "put" search string', function (done) {
    expect(startsWith(str, 'put')).to.be.false;
    done();
  });

  it('returns false for a longer search string', function (done) {
    var longerString = 'We put comprehension and mastery above all else!';
    expect(startsWith(str, longerString)).to.be.false;
    done();
  });
});