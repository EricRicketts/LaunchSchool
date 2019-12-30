describe('practice problems variables and numbers', function() {
  var numerator, denominator, answer, incrementer, start, end, difference;

  beforeEach(function () {
    numerator = 10;
    denominator = 2;
    answer = numerator / denominator;
    incrementer = 1;
    start = incrementer;
  });

  it('exercise 1: numerator is set to 10', function () {
    expect(numerator).to.equal(10);
  });

  it('exercise 2: denominator is set to 2', function () {
    expect(denominator).to.equal(2);
  });

  it('exercise 3: answer should be 5', function () {
    answer = numerator / denominator;
    expect(answer).to.equal(5);
  });

  it('exercise 4: incrementer set to 1', function () {
    expect(incrementer).to.equal(1);
  });

  it('exercise 5: start set to incrementer', function () {
    start = incrementer;
    expect(start).to.equal(1);
  });

  it('exercise 6: end and difference are undefined', function () {
    expect([end, difference]).to.deep.equal([undefined, undefined]);
  });

  it('exercise 7: incremet incremeter three times', function () {
    incrementer += 1;
    incrementer += 1;
    incrementer += 1;

    expect(incrementer).to.equal(4);
  });

  it('exercise 8: increment incremeter two times', function () {
    incrementer++;
    incrementer++;

    expect(incrementer).to.equal(3);
  });

  it('exercise 9: difference set to 5', function () {
    incrementer = 6;
    start = 1;
    end = incrementer;
    difference = end - start;

    expect(difference).to.equal(5);
  });

  it('exercise 10: answer set to 126', function () {
    answer = (11 + 31) * 3;
    expect(answer).to.equal(126);
  });
});