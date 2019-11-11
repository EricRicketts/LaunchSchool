describe('FizzBuzz', function () {
  var expected;

  function checkNumber(number) {
    var n;
    if (number % 15 === 0) {
      n = 'FizzBuzz';
    }
    else if (number % 3 === 0) {
      n = 'Fizz';
    }
    else if (number % 5 === 0) {
      n = 'Buzz';
    } else {
      n = number;
    }

    return n;
  }

  function fizzbuzz() {
    return [...Array(101).keys()].slice(1).map(checkNumber);
  }

  function checkNumberRefactor(number) {
    var output = '';
    if (number % 3 === 0) {
      output += 'Fizz';
    }
    if (number % 5 === 0) {
      output += 'Buzz';
    }

    return (output || number)
  }

  function fizzbuzzRefactor() {
    return [...Array(101).keys()].slice(1).map(checkNumberRefactor);
  }

  beforeEach(function () {
    expected = [
      1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz",
      "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17,
      "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz",
      26, "Fizz", 28, 29, "FizzBuzz", 31, 32, "Fizz", 34,
      "Buzz", "Fizz", 37, 38, "Fizz", "Buzz", 41, "Fizz",
      43, 44, "FizzBuzz", 46, 47, "Fizz", 49, "Buzz", "Fizz",
      52, 53, "Fizz", "Buzz", 56, "Fizz", 58, 59, "FizzBuzz",
      61, 62, "Fizz", 64, "Buzz", "Fizz", 67, 68, "Fizz",
      "Buzz", 71, "Fizz", 73, 74, "FizzBuzz", 76, 77, "Fizz",
      79, "Buzz", "Fizz", 82, 83, "Fizz", "Buzz", 86, "Fizz",
      88, 89, "FizzBuzz", 91, 92, "Fizz", 94, "Buzz", "Fizz",
      97, 98, "Fizz", "Buzz"
    ];
  });

  it('check fizzbuzz', function (done) {
    expect(fizzbuzz()).to.deep.equal(expected)
    done();
  });

  it('check fizzbuzz refactored', function (done) {
    expect(fizzbuzzRefactor()).to.deep.equal(expected)
    done();
  });
});