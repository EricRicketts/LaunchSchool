describe('Test if number is prime', function () {
  function isEven(number) {
    return (number % 2) === 0;
  }

  function isPrime(number) {
    return (number < 10 ? primesLessThanTen(number) : primesGreaterThanTen(number));
  }

  function primesGreaterThanTen(number) {
    var upperBound = Math.floor(Math.sqrt(number));
    if (isEven(number)) { return false; }
    for(var i = 3; i <= upperBound; i += 2) {
      if ((number % i) === 0) { return false; }
    }
    return true;
  }

  function primesLessThanTen(number) {
    return (number === 2 || number === 3 || number === 5 || number === 7);
  }

  it('0 should be false', function (done) {
    expect(isPrime(0)).to.be.false;
    done();
  });

  it('1 should be false', function (done) {
    expect(isPrime(1)).to.be.false;
    done();
  });

  it('2 should be true', function (done) {
    expect(isPrime(2)).to.be.true;
    done();
  });

  it('3 should be true', function (done) {
    expect(isPrime(3)).to.be.true;
    done();
  });

  it('4 should be false', function (done) {
    expect(isPrime(4)).to.be.false;
    done();
  });

  it('5 should be true', function (done) {
    expect(isPrime(5)).to.be.true;
    done();
  });

  it('6 should be false', function (done) {
    expect(isPrime(6)).to.be.false;
    done();
  });

  it('7 should be true', function (done) {
    expect(isPrime(7)).to.be.true;
    done();
  });

  it('8 should be false', function (done) {
    expect(isPrime(8)).to.be.false;
    done();
  });

  it('9 should be false', function (done) {
    expect(isPrime(9)).to.be.false;
    done();
  });

  it('10 should be false', function (done) {
    expect(isPrime(10)).to.be.false;
    done();
  });

  it('43 should be true', function (done) {
    expect(isPrime(43)).to.be.true;
    done();
  });

  it('55 should be false', function (done) {
    expect(isPrime(55)).to.be.false;
    done();
  });

  it('53 should be true', function (done) {
    expect(isPrime(53)).to.be.true;
    done();
  });

  it('73 should be true', function (done) {
    expect(isPrime(73)).to.be.true;
    done();
  });

  it('77 should be false', function (done) {
    expect(isPrime(77)).to.be.false;
    done();
  });

  it('99 should be false', function (done) {
    expect(isPrime(99)).to.be.false;
    done();
  });
});