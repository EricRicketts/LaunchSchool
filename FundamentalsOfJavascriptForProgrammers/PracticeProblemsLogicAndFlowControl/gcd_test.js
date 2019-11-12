describe('Greatest Common Denominator', function () {
  function gcd(a, b) { 
    var remainder = Math.max(a, b) % Math.min(a, b);
    return (remainder === 0 ? Math.min(a, b) : gcd(Math.min(a, b), remainder));
  }

  it('GCD between 12 and 4', function (done) {
    expect(gcd(12, 4)).to.equal(4);
    done();
  });

  it('GCD between 15 and 10', function (done) {
    expect(gcd(15, 10)).to.equal(5);
    done();
  });

  it('GCD between 9 and 2', function (done) {
    expect(gcd(9, 2)).to.equal(1);
    done();
  });

  it('GCD between 270 and 192', function (done) {
    expect(gcd(270, 192)).to.equal(6);
    done();
  });
});