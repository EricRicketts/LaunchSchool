describe('Index of Substring', function () {
  var expected;

  function indexOf(str, targetSubstr) {
    var beginningIndex = -1;
    var strSize = str.length;
    var targetSubstrSize = targetSubstr.length;

    for(var i = 0; i <= strSize - targetSubstrSize; i++) {
      var currentSubstr = '';
      var matchingIndex = i;
      for(var j = i; j < i + targetSubstrSize; j++) {
        currentSubstr += str[j];
      }

      if (targetSubstr === currentSubstr) {
        beginningIndex = matchingIndex;
        break;
      }
    }

    return beginningIndex;
  }

  function lastIndexOf(str, targetSubstr) {
    var beginningIndex = -1;
    var strSize = str.length;
    var targetSubstrSize = targetSubstr.length;

    for(var i = strSize - targetSubstrSize; i >= 0; i--) {
      var currentSubstr = '';
      var matchingIndex = i;
      for(var j = i; j < i + targetSubstrSize; j++) {
        currentSubstr += str[j];
      }

      if (targetSubstr === currentSubstr) {
        beginningIndex = matchingIndex;
        break;
      }
    }

    return beginningIndex;
  }

  it('find \"s\" in \"Some strings\"', function (done) {
    expect(indexOf('Some strings', 's')).to.equal(5);
    done();
  });

  it('find \"Whale\" in \"Blue Whale\"', function (done) {
    expect(indexOf('Blue Whale', 'Whale')).to.equal(5);
    done();
  });

  it('find \"Blute\" in \"Blue Whale\"', function (done) {
    expect(indexOf('Blue Whale', 'Blute')).to.equal(-1);
    done();
  });

  it('find \"foo\" in \"fizz buzz barbazz foobar\"', function (done) {
    expect(indexOf('fizz buzz barbazz foobar', 'foo')).to.equal(18);
    done();
  });

  it('find \"leB\" in \"Blue Whale\"', function (done) {
    expect(indexOf('Blue Whale', 'leB')).to.equal(-1);
    done();
  });

  it('find last \"s\" in \"Some strings\"', function (done) {
    expect(lastIndexOf('Some strings', 's')).to.equal(11);
    done();
  });

  it('find last \"Whale\" in \"Blue Whale, Killer Whale\"', function (done) {
    expect(lastIndexOf('Blue Whale, Killer Whale', 'Whale')).to.equal(19);
    done();
  });

  it('find last \"all\" in \"Blue Whale, Killer Whale\"', function (done) {
    expect(lastIndexOf('Blue Whale, Killer Whale', 'all')).to.equal(-1);
    done();
  });
});