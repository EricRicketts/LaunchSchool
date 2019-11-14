describe('Splitting A String', function () {
  var expected;

  function splitString(str, delimiter) {
    var splitStrings = [];

    switch(delimiter) {
      case undefined:
        splitStrings = noDelimiter();
        break;
      case '':
        splitStrings = emptyStringDelimiter(str);
        break;
      default:
        splitStrings = normalDelimiter(str, delimiter);
    }

    return splitStrings;
  }

  function normalDelimiter(str, delimiter) {
    var str = removeDelimitersAtEnd(str, delimiter);
    var splitStrings = [];
    var tempString = '';
    var strSize = str.length;

    for (var i = 0; i < strSize; i++) {
      if (str[i] === delimiter) {
        splitStrings.push(tempString);
        tempString = '';
      } else {
        tempString += str[i];
      }
    }

    splitStrings.push(tempString);
    return splitStrings;
  }

  function emptyStringDelimiter(str) {
    var strSize = str.length;
    var splitChars = [];

    for (var i = 0; i < strSize; i++) {
      splitChars.push(str[i]);
    }

    return splitChars;
  }

  function noDelimiter() {
    return ['ERROR: No delimiter'];
  }

  function removeDelimitersAtEnd(str, delimiter) {
    var strSize = str.length;
    var endIndex = -1;
    var cleanString = '';

    for(var i = strSize - 1; i >= 0; i--) {
      if (str[i] === delimiter) {
        endIndex = i;
      } else {
        break;
      }
    }

    if (endIndex === -1) {
      cleanString = str;
    } else {
      for(var i = 0; i < endIndex; i++) {
        cleanString += str[i];
      }
    }

    return cleanString;
  }

  it('splits a string with a delimiter', function (done) {
    expected = ['abc', '123', 'hello world'];
    expect(splitString('abc,123,hello world', ',')).to.deep.equal(expected);
    done();
  });

  it('raises an error with no delimiter give', function(done) {
    expected = ['ERROR: No delimiter'];
    expect(splitString('hello')).to.deep.equal(expected);
    done();
  });

  it('an empty delimiter returns the chracters of the string', function (done) {
    expected = ['h', 'e', 'l', 'l', 'o'];
    expect(splitString('hello', '')).to.deep.equal(expected);
    done();
  });

  it('a non matched delimiter returns the string', function (done) {
    expected = ['hello'];
    expect(splitString('hello', ';')).to.deep.equal(expected);
    done();
  });

  it('unaccompanied delimiters return an empty string', function (done) {
    expected = ['', 'hello']
    expect(splitString(';hello;', ';')).to.deep.equal(expected);
    done();  
  });

  it('more than one delimiters at the end are ignored', function (done) {
    expected = ['', 'foo', 'bar'];
    expect(splitString(';foo;bar;;;', ';')).to.deep.equal(expected);
    done();
  });
});