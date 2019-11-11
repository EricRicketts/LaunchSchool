describe('Print Multiples', function () {
  function isOdd(n) {
    return (n % 2) === 1;
  }

  function isMultiple(multiple, number) {
    return (multiple % number) === 0;
  }

  function logMultiples(n) {
    var upperBound = 100;
    var multiple = 1;
    var arr = [];
    while (multiple * n <= upperBound) {
      if (isOdd(multiple)) {
        arr.push(multiple * n);
      }

      multiple += 1;
    }

    return arr.reverse();
  }

  function logMultiplesLaunchSchool(number) {
    arr = [];
    for (var i = 100; i >= number; i--) {
      if (isOdd(i) && isMultiple(i, number)) {
        arr.push(i);
      }  
    }

    return arr;
  }

  function logMultiplesFurtherExploration(number) {
    var arr = [];
    var upperBound = 100;
    var multiple = Math.floor(upperBound / number) * number;
    while (multiple > 0) {
      if (isOdd(multiple)) { arr.push(multiple); }
      multiple -= number;
    }

    return arr;
  }

  it('Multiples of 17', function (done) {
    var expected = [85, 51, 17];
    expect(logMultiples(17)).to.deep.equal(expected);
    done();
  });

  it('Multiples of 21', function (done) {
    var expected = [63, 21];
    expect(logMultiples(21)).to.deep.equal(expected);
    done();
  });

  it('Multiples of 17 Launch School version', function (done) {
    var expected = [85, 51, 17];
    expect(logMultiplesLaunchSchool(17)).to.deep.equal(expected);
    done();
  });

  it('Multiples of 21 Launch School version', function (done) {
    var expected = [63, 21];
    expect(logMultiplesLaunchSchool(21)).to.deep.equal(expected);
    done();
  });

  it('Multiples of 17 Futher Exploration version', function (done) {
    var expected = [85, 51, 17];
    expect(logMultiplesFurtherExploration(17)).to.deep.equal(expected);
    done();
  });

  it('Multiples of 21 Futher Exploration version', function (done) {
    var expected = [63, 21];
    expect(logMultiplesFurtherExploration(21)).to.deep.equal(expected);
    done();
  });
});