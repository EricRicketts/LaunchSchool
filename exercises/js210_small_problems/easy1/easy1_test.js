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

  it('Problem 6: Short Long Short', function (done) {
    expect(shortLongShort('abc', 'defgh')).to.equal('abcdefghabc');
    expect(shortLongShort('abcde', 'fgh')).to.equal('fghabcdefgh');
    expect(shortLongShort('', 'xyz')).to.equal('xyz');
    done();
  });

  it('Problem 7: Leap Years Part 1', function (done) {
    expect(isLeapYear(2016)).to.be.true;
    expect(isLeapYear(2015)).to.be.false;
    expect(isLeapYear(2100)).to.be.false;
    expect(isLeapYear(2400)).to.be.true;
    expect(isLeapYear(240000)).to.be.true;
    expect(isLeapYear(240001)).to.be.false;
    expect(isLeapYear(2000)).to.be.true;
    expect(isLeapYear(1900)).to.be.false;
    expect(isLeapYear(1752)).to.be.true;
    expect(isLeapYear(1700)).to.be.false;
    expect(isLeapYear(1)).to.be.false;
    expect(isLeapYear(100)).to.be.false;
    expect(isLeapYear(400)).to.be.true;  
    done();
  });

  it('Problem 8: Leap Years Part 2', function (done) {
    expect(isLeapYearBritish(2016)).to.be.true;
    expect(isLeapYearBritish(2015)).to.be.false;
    expect(isLeapYearBritish(2100)).to.be.false;
    expect(isLeapYearBritish(2400)).to.be.true;
    expect(isLeapYearBritish(240000)).to.be.true;
    expect(isLeapYearBritish(240001)).to.be.false;
    expect(isLeapYearBritish(2000)).to.be.true;
    expect(isLeapYearBritish(1900)).to.be.false;
    expect(isLeapYearBritish(1752)).to.be.true;
    expect(isLeapYearBritish(1700)).to.be.true;
    expect(isLeapYearBritish(1)).to.be.false;
    expect(isLeapYearBritish(100)).to.be.true;
    expect(isLeapYearBritish(400)).to.be.true;  
    done();
  });

  it('Problem 9: Sum multiples of 3 and 5', function (done) {
    expect(multisum(3)).to.equal(3);
    expect(multisum(5)).to.equal(8);
    expect(multisum(10)).to.equal(33);
    expect(multisum(1000)).to.equal(234168);
    done();
  });

  it('Problem 10: ASCII String Value', function (done) {
    expect(asciiValue('Four score')).to.equal(984);
    expect(asciiValue('Launch School')).to.equal(1251);
    expect(asciiValue('a')).to.equal(97);
    expect(asciiValue('')).to.equal(0);
    done();
  });
});