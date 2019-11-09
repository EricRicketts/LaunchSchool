describe('Multiples of 3 and 5', function () {
  var expected;

  function fizzbuzzVersionOne () {
    var arr = [];
    for (var i = 1; i <= 100; i++) {
      if (i % 15 === 0) {
        arr.push(i.toString() + '!');
      } else if ((i % 3 === 0) || (i % 5 === 0)) {
        arr.push(i.toString())
      }
    }

    return arr;
  }

  function fizzbuzzVersionTwo (start, end) {
    var arr = [];
    for (var i = start; i <= end; i++) {
      if (i % 15 === 0) {
        arr.push(i.toString() + '!');
      } else if ((i % 3 === 0) || (i % 5 === 0)) {
        arr.push(i.toString())
      }
    }

    return arr;
  }

  beforeEach(function () {
      expected = [3, 5, 6, 9, 10, 12, 15, 18, 20, 21, 24,
      25, 27, 30, 33, 35, 36, 39, 40, 42, 45, 48, 50, 51,
      54, 55, 57, 60, 63, 65, 66, 69, 70, 72, 75, 78, 80,
      81, 84, 85, 87, 90, 93, 95, 96, 99, 100].map(x => x.toString());

      expected = expected.map(x => (Number(x) % 15) === 0 ? x + '!' : x);
    });

  it('fizzbuzz version one', function (done) {
    expect(fizzbuzzVersionOne()).to.deep.equal(expected);
    done();
  });

  it('fizzbuzz version two', function (done) {
    expect(fizzbuzzVersionTwo(1, 100)).to.deep.equal(expected);
    done();
  });  
});