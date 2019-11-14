describe('Trimming Spaces', function () {
  function trim(str) {
    var trimmedStr = '';
    var firstIndex = firstNonSpaceIndex(str);
    var lastIndex = lastNonSpaceIndex(str)

    if (firstIndex === -1) { return ''; }
    for(var i = firstIndex; i <= lastIndex; i++) {
      trimmedStr += str[i];
    }

    return trimmedStr;
  }

  function firstNonSpaceIndex(str) {
    var strSize = str.length;
    var firstIndex = -1;
    for(var i = 0; i < strSize; i++) {
      if (str[i] !== ' ') {
        firstIndex = i;
        break;
      }
    }

    return firstIndex;
  }

  function lastNonSpaceIndex(str) {
    var strSize = str.length;
    var lastIndex = -1;
    for(var i = strSize - 1; i >= 0; i--) {
      if (str[i] !== ' ') {
        lastIndex = i;
        break;
      }
    }

    return lastIndex;
  }


  it('trims "  abc" from the front', function (done) {
    expect(trim('  abc')).to.equal('abc');
    done();
  });

  it('trims "abc  " from the rear', function (done) {
    expect(trim('abc  ')).to.equal('abc');
    done();
  });

  it('trims "  abc  " from front and rear', function (done) {
    expect(trim('  abc  ')).to.equal('abc');
    done();
  });

  it('trims "  ab c" leaving internal spaces', function (done) {
    expect(trim('  ab c')).to.equal('ab c');
    done();
  });

  it('trims "ab c  " leaving internal spaces', function (done) {
    expect(trim('ab c  ')).to.equal('ab c');
    done();
  });

  it('trims "  ab c  " leaving internal spaces', function (done) {
    expect(trim('  ab c  ')).to.equal('ab c');
    done();
  });

  it('trims "  a b  c"', function (done) {
    expect(trim('  a b  c')).to.equal('a b  c');
    done();  
  });

  it('trims a string of only empty spaces', function (done) {
    expect(trim('  ')).to.equal('');
    done();
  });

  it('trims an empty string', function (done) {
    expect(trim('')).to.equal('');
    done();
  });
});