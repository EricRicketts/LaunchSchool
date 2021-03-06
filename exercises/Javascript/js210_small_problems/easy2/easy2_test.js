describe('JS210 Small Problems: Easy 2', function () {
  var expectedStr;

  it('Problem 1: Daily Double', function (done) {
    expect(crunch('ddaaiillyy ddoouubbllee')).to.equal('daily double');
    expect(crunch('4444abcabccba')).to.equal('4abcabcba');
    expect(crunch('ggggggggggggggg')).to.equal('g');
    expect(crunch('a')).to.equal('a');
    expect(crunch('')).to.equal('');
    done();
  });

  it('Problem 1A: Daily Double', function (done) {
    expect(crunchManual('ddaaiillyy ddoouubbllee')).to.equal('daily double');
    expect(crunchManual('4444abcabccba')).to.equal('4abcabcba');
    expect(crunchManual('ggggggggggggggg')).to.equal('g');
    expect(crunchManual('a')).to.equal('a');
    expect(crunchManual('')).to.equal('');
    done();
  });

  it('Problem 2A: Bannerizer', function (done) {
    expectedStr = '+--+\n' + '|  |\n' + '|  |\n' +
      '|  |\n' + '+--+\n';
    expect(logInBox('')).to.equal(expectedStr);
    done();
  });

  it('Problem 2B: Bannerizer', function (done) {
    var str = 'To boldly go where no one has gone before.';
    expectedStr = '' +
      '+--------------------------------------------+\n' +
      '|                                            |\n' + 
      '| To boldly go where no one has gone before. |\n' +
      '|                                            |\n' +
      '+--------------------------------------------+\n';
    expect(logInBox(str)).to.equal(expectedStr);
    done();
  });

  it('Problem 3: Stringy Strings', function (done) {
    expect(stringy(6)).to.equal('101010');
    expect(stringy(9)).to.equal('101010101');
    expect(stringy(4)).to.equal('1010');
    expect(stringy(7)).to.equal('1010101')
    done();
  });

  it('Problem 4: Fibonacci Number Location By Length', function (done) {
    expect(findFibonacciIndexByLength(2)).to.equal(7);
    expect(findFibonacciIndexByLength(10)).to.equal(45);
    expect(findFibonacciIndexByLength(16)).to.equal(74);
    done();
  });

  it('Problem 5A: Right Triangles', function (done) {
    var rightTriangleFive = '' +
    '    *\n' +
    '   **\n' +
    '  ***\n' +
    ' ****\n' +
    '*****\n';
    expect(triangle(5)).to.equal(rightTriangleFive);
    done();
  });

  it('Problem 5B: Right Triangles', function (done) {
    var rightTriangleNine = '' +
    '        *\n' +
    '       **\n' +
    '      ***\n' +
    '     ****\n' +
    '    *****\n' +
    '   ******\n' +
    '  *******\n' +
    ' ********\n' +
    '*********\n';
    expect(triangle(9)).to.equal(rightTriangleNine);
    done();
  });

  it('Problem 6: Madlibs', function (done) {
    var noun = 'dog';
    var verb = 'walk';
    var adjective = 'blue';
    var adverb = 'quickly';

    var statement = "Do you walk your blue dog quickly?  That's hilarious!\n";

    expect(madlibs(noun, verb, adjective, adverb))
    done();
  });

  it('Problem 7: Double Doubles', function (done) {
    expect(twice(37)).to.equal(74);
    expect(twice(44)).to.equal(44);
    expect(twice(334433)).to.equal(668866);
    expect(twice(444)).to.equal(888);
    expect(twice(107)).to.equal(214);
    expect(twice(103103)).to.equal(103103);
    expect(twice(3333)).to.equal(3333);
    expect(twice(7676)).to.equal(7676);
    done();
  });

  it('Problem 8: Grade Book', function (done) {
    expect(getGrades(95, 90, 93)).to.equal('A');
    expect(getGrades(50, 50, 95)).to.equal('D');
    done();
  });

  it('Problem 9: Clean Up The Words', function (done) {
    expect(cleanUp("---what's my +*& line?")).to.equal(' what s my line ');
    done();
  });

  it('Problem 10: What Century Is That', function (done) {
    expect(century(2000)).to.equal('20th');
    expect(century(2001)).to.equal('21st');
    expect(century(1965)).to.equal('20th');
    expect(century(256)).to.equal('3rd');
    expect(century(5)).to.equal('1st');
    expect(century(10103)).to.equal('102nd');
    expect(century(1052)).to.equal('11th');
    expect(century(1127)).to.equal('12th');
    expect(century(11201)).to.equal('113th');
    done();
  });
});