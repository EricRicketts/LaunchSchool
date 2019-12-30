describe('Substring Version One', function () {
  var string = 'hello world';

  it('returns substring starting at index 2 and length of 4', function (done) {
    expect(substr(string, 2, 4)).to.equal('llo ');
    done();
  });

  it('returns substring starting at index -2 and length of 2', function (done) {
    expect(substr(string, -3, 2)).to.equal('rl');
    done();
  });

  it('returns substring starting at index 8 and length of 20', function (done) {
    expect(substr(string, 8, 20)).to.equal('rld');
    done();
  });

  it('returns empty string starting at index 0 and length of -20', function (done) {
    expect(substr(string, 0, -20)).to.equal('');
    done();
  });

  it('returns empty string starting at index 0 and length of 0', function (done) {
    expect(substr(string, 0, 0)).to.equal('');
    done();
  });
});