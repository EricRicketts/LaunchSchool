describe('Pattern Generation', function () {
  var expected;

  function generatePattern(size) {
    var numbers = [...Array(size).keys()].map(function(n) { return n + 1; });
    var maxNumber = numbers.length;

    var result = numbers.map(function(n, idx, numArr) {
      var numericPart = numArr.slice(0, n).join('');
      var asteriskPart = numArr.slice(n, maxNumber).map(function(num) {
        var strSize = String(num).length;
        return '*'.repeat(strSize);
      }).join('');

      return (numericPart + asteriskPart);
    });

    return result;
  }

  it('pattern of 3', function (done) {
    expected = ['1**','12*','123'];
    expect(generatePattern(3)).to.deep.equal(expected);
    done();
  });

  it('pattern of 7', function (done) {
    expected = [
      '1******', '12*****', '123****', '1234***',
      '12345**', '123456*', '1234567'
    ];
    expect(generatePattern(7)).to.deep.equal(expected);
    done();
  });

  it('pattern of 20', function (done) {
    expected = [
    '1******************************',
    '12*****************************',
    '123****************************',
    '1234***************************',
    '12345**************************',
    '123456*************************',
    '1234567************************',
    '12345678***********************',
    '123456789**********************',
    '12345678910********************',
    '1234567891011******************',
    '123456789101112****************',
    '12345678910111213**************',
    '1234567891011121314************',
    '123456789101112131415**********',
    '12345678910111213141516********',
    '1234567891011121314151617******',
    '123456789101112131415161718****',
    '12345678910111213141516171819**',
    '1234567891011121314151617181920'
    ];
    expect(generatePattern(20)).to.deep.equal(expected);
    done();
  });
});