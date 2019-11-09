describe('Odd Numbers', function () {
  var expected;

  function logOddNumbers (end) {
    var arr = [];
    for (var i = 1; i <= end; i++) {
      if ((i % 2) === 1) {
        arr.push(i)
      }
    }

    return arr;
  }

  function logOddNumbersVersionTwo (end) {
    return [...Array(end + 1).keys()].slice(1).filter(n => (n % 2) === 1);
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
});