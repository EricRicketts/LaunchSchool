describe('JS210 Small Problems: Easy 2', function () {
  var expectedStr;

  it('Problem 1: Daily Double', function (done) {
    expect(crunch('ddaaiillyy ddoouubbllee')).to.equal('daily double');
    expect(crunch('4444abcabccba')).to.equal('4abcabcba');
    expect(crunch('ggggggggggggggg')).to.equal('g');
    expect(crunch('a')).to.equal('a');
    expect(crunch('')).to.equal('');
    done();
  });

  it('Problem 1A: Daily Double', function (done) {
    expect(crunchManual('ddaaiillyy ddoouubbllee')).to.equal('daily double');
    expect(crunchManual('4444abcabccba')).to.equal('4abcabcba');
    expect(crunchManual('ggggggggggggggg')).to.equal('g');
    expect(crunchManual('a')).to.equal('a');
    expect(crunchManual('')).to.equal('');
    done();
  });

  it('Problem 2A: Bannerizer', function (done) {
    expectedStr = '+--+\n' + '|  |\n' + '|  |\n' +
      '|  |\n' + '+--+\n';
    expect(logInBox('')).to.equal(expectedStr);
    done();
  });

  it('Problem 2B: Bannerizer', function (done) {
    var str = 'To boldly go where no one has gone before.';
    expectedStr = '' +
      '+--------------------------------------------+\n' +
      '|                                            |\n' + 
      '| To boldly go where no one has gone before. |\n' +
      '|                                            |\n' +
      '+--------------------------------------------+\n';
    expect(logInBox(str)).to.equal(expectedStr);
    done();
  });

});