describe('Practice Problems: Arrays', function () {
  var arr, expected;

  it('Problem 1: Array Last Value', function (done) {
    arr = [0, 1, 2, 3, 4];
    expect(lastInArray(arr)).to.equal(4);
    done();
  });

  it('Problem 2: Roll Call', function (done) {
    arr = ['Foo', 'Bar', 'Fizz', 'Buzz'];
    expect(rollCall(arr)).to.equal('Foo\nBar\nFizz\nBuzz\n');
    done();
  });

  it('Problem 3: Reverse Values', function (done) {
    arr = [1, 'foo', 10, 'bar'];
    expected = ['bar', 10, 'foo', 1];
    expect(reverse(arr)).to.deep.equal(expected); 
    done();
  });

  it('Problem 4: Find a value', function (done) {
    arr = ['in', 'out', 1, 3, 'fizzbuzz', 'up', 'down'];
    expect(findValIn(arr, 'up')).to.equal(5);
    expect(findValIn(arr, 'fizz')).to.equal(-1);
    done();
  });

  it('Problem 5: Concat Values', function (done) {
    arr = ['in', 1, true, undefined, null];
    expect(concatValues(arr)).to.equal('in1trueundefinednull');
    done();  
  });
});