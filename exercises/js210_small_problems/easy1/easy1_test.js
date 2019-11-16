describe('JS210 Small Problems: Easy 1', function () {
  var expected;

  it('Problem 1: Odd Numbers', function (done) {
  var oddNumbersTo99 = [];
  var arrTo99 = [...Array(99).keys()].map(n => n + 1);

  for(var i = 1; i < 100; i += 2) {
    oddNumbersTo99.push(i);
  } 

  expect(collectOddNumbersTo(99)).to.deep.equal(oddNumbersTo99);
  done();
  });

  it('Problem 2: Even Numbers', function (done) {
  var evenNumbersTo99 = [];
  var arrTo99 = [...Array(99).keys()].map(n => n + 1);

  for(var i = 2; i < 100; i += 2) {
    evenNumbersTo99.push(i);
  } 

  expect(collectEvenNumbersTo(99)).to.deep.equal(evenNumbersTo99);
  done();
  });

  it('Problem 3: How Big Is The Room', function (done) {
    expected = 'The area of the room is 70.00 square meters (753.47 square feet).';
    expect(roomArea(10, 7)).to.equal(expected);
    done();
  });

  it('Problem 4: Tip Calculator', function (done) {
    expected = 'The tip is $30.00.\nThe total is $230.00.';
    expect(tipCalculator(200, 15)).to.equal(expected);
    done();
  });

  it('Problem 5: Sum or Product of Consecutive Integers', function (done) {
    var firstExpected = 'The sum of the integers between 1 and 5 is 15.'
    var secondExpected = 'The product of the integers between 1 and 6 is 720.';
    expect(sumOrProductOfIntegersTo(5, 's')).to.equal(firstExpected);
    expect(sumOrProductOfIntegersTo(6, 'p')).to.equal(secondExpected);
    done();
  });
});