var averages = require('./lib');

describe('Practice Problems Function', function () {
  
  beforeEach(function () {
    function average(a, b, c) {
      return (a + b + c) / 3;
    }
  });

  it('exercise 1: first average function', function (done) {
    expect(averages.firstAverage(1, 2, 3)).to.equal(2);
    done();
  });

  it('exercise 2: second average function', function (done) {
    expect(averages.secondAverage(4, 5, 6)).to.equal(5);
    done();  
  });

  it('exericse 3: second average function more arguments', function (done) {
    expect(averages.secondAverage(7, 8, 9, 10, 11)).to.equal(9);
    done();
  });

  it('exercise 4: accept array as argument', function (done) {
    expect(averages.thirdAverage([10, 11, 12])).to.equal(11);
    done();
  });
});