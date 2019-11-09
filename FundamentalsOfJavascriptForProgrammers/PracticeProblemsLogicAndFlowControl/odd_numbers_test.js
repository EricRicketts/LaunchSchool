describe('Odd Numbers', function () {
  var expected;

  function isEven (val) {
    return (val % 2) === 0;
  }

  function logOddNumbers (end) {
    var arr = [];
    for (var i = 1; i <= end; i++) {
      if ((i % 2) === 1) {
        arr.push(i);
      }
    }

    return arr;
  }

  function logOddNumbersVersionTwo (end) {
    return [...Array(end + 1).keys()].slice(1).filter(n => (n % 2) === 1);
  }

  function logOddNumbersVersionThree (end) {
    var arr = [];
    for (var i = 1; i <= end; i += 2) {
      arr.push(i);
    }

    return arr;
  }

  function logOddNumbersVersionFour (end) {
    var arr = [];
    for (var i = 0; i <= end; i++) {
      if (isEven(i)) {
        continue;
      } else {
        arr.push(i)
      }
    }

    return arr;
  }

  beforeEach(function () {
    expected = [1, 3, 5, 7, 9, 11, 13, 15, 17, 19];
  });

  it('first version logs odd numbers', function (done) {
    expect(logOddNumbers(19)).to.deep.equal(expected);
    done();
  });

  it('second version logs odd numbers', function (done) {
    expect(logOddNumbersVersionTwo(19)).to.deep.equal(expected);
    done();
  });

  it('third version logs odd numbers', function (done) {
    expect(logOddNumbersVersionThree(19)).to.deep.equal(expected);
    done();
  });

  it('fourth version logs odd numbers', function (done) {
    expect(logOddNumbersVersionFour(19)).to.deep.equal(expected);
    done();
  });

});