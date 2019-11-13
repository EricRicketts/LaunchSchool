describe('Check Goldbach Conjecture', function () {
  function checkGoldback(number) {
    var arrayOfPrimes, combinations, allPrimePairs, goldBachNumbers;
    if (!isEven(number)) { return null; }

    arrayOfPrimes = collectPrimesTo(number).map(function(n) {
      return [n, n];
    });

    combinations = formCombinationsOf(arrayOfPrimes);
    allPrimePairs = arrayOfPrimes.concat(combinations);
    goldBachNumbers = allPrimePairs.filter(function(pair) { return (pair[0] + pair[1] === number); });

    return goldBachNumbers;
  }

  function collectPrimesTo(number) {
    var arrayOfPrimes = [];
    for (var i = 2; i <= number; i++) {
      if (isPrime(i)) { arrayOfPrimes.push(i); }
    }

    return arrayOfPrimes;
  }

  function formCombinationsOf(arrayOfPrimes) {
    var arraySize, combinations, leadPrime, remainingPrimeArray, sliceSize;
    arraySize = arrayOfPrimes.length;
    combinations = [];

    for (var i = 1; i < arraySize; i++) {
      leadPrime = arrayOfPrimes[i - 1][0];
      remainingPrimeArray = arrayOfPrimes.slice(i);
      sliceSize = remainingPrimeArray.length;

      for (var j = 0; j < sliceSize; j++) {
        combinations.push([leadPrime, remainingPrimeArray[j][0]]);
      }

    }

    return combinations;
  }

  function isEven(n) {
    return (n % 2) === 0;
  }

  function isPrime(n) {
    var primeNumber = true;

    if (n < 2) { primeNumber = false; }

    for (var i = 3; i < n; i += 2) {
      if (isEven(n) || n % i === 0) {
        primeNumber = false;
        break;
      }
    }

    return primeNumber;
  }

  it('odd numbers should return null', function (done) {
    expect(checkGoldback(3)).to.be.null;
    done();
  });

  it('4 should return 2 and 2', function (done) {
    expect(checkGoldback(4)).to.deep.equal([[2, 2]]);
    done();
  });

  it('12 should return 5 and 7', function (done) {
    expect(checkGoldback(12)).to.deep.equal([[5, 7]]);
    done();
  });

  it('24 should return 3 pairs of primes', function (done) {
    expect(checkGoldback(24)).to.deep.equal([[5, 19], [7, 17], [11, 13]]);
    done();
  });

  it('100 should return 6 pairs of primes', function (done) {
    var expected = [[3, 97], [11, 89], [17, 83], [29, 71], [41, 59], [47, 53]]
    expect(checkGoldback(100)).to.deep.equal(expected);
    done();
  });
});