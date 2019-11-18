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

  it('Problem 3: Stringy Strings', function (done) {
    expect(stringy(6)).to.equal('101010');
    expect(stringy(9)).to.equal('101010101');
    expect(stringy(4)).to.equal('1010');
    expect(stringy(7)).to.equal('1010101')
    done();
  });

  it('Problem 4: Fibonacci Number Location By Length', function (done) {
    expect(findFibonacciIndexByLength(2)).to.equal(7);
    expect(findFibonacciIndexByLength(10)).to.equal(45);
    expect(findFibonacciIndexByLength(16)).to.equal(74);
    done();
  });

});