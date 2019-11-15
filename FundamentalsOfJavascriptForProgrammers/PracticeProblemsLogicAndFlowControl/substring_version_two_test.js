describe('Substring Version Two', function () {
  var string = 'hello world';

  it('returns substring starting at index 2 and end of 4', function (done) {
    expect(substring(string, 2, 4)).to.equal('ll');
    done();
  });

  it('returns substring starting at index 8 and end of 20', function (done) {
    expect(substring(string, 8, 20)).to.equal('rld');
    done();
  });

  it('returns empty string starting at index 0 and end of -1', function (done) {
    expect(substring(string, 0, -1)).to.equal('');
    done();
  });

  it('returns empty string with start and end the same number', function (done) {
    expect(substring(string, 4, 4)).to.equal('');
    done();
  });

  it('accommodates situation where end is greater than start', function (done) {
    expect(substring(string, 4, 2)).to.equal('ll');
    done();
  });

  it('returns substring with valid start and no end', function (done) {
    expect(substring(string, 2)).to.equal('llo world');
    done();
  });

  it('returns entire string with non numeric start', function (done) {
    expect(substring(string, 'a')).to.equal('hello world');
    done();
  });
});