describe('Javascript Basics', function () {
  var paragraph, myBoolean, myString, myArray, myOtherString, stdout, stringToInteger;
  var stringToSignedInteger, checkForSign, integerToSting, signedIntegerToString;

  beforeEach(function () {
    paragraph = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse sed \
                ligula at risus vulputate faucibus. Aliquam venenatis nibh ut justo dignissim \
                dignissim. Proin dictum purus mollis diam auctor sollicitudin. Ut in bibendum \
                ligula. Suspendisse quam ante, dictum aliquam tristique id, porttitor pulvinar \
                diam. Maecenas blandit aliquet ipsum. Integer vitae sapien sed nulla rutrum \
                hendrerit ac a urna. Interdum et malesuada fames ac ante ipsum primis in faucibus.';
    myBoolean = true;
    myString = 'hello';
    myArray = [];
    myOtherString = '';
    stdout = require('test-console').stdout;

    checkForSign = function (char) {
      if (char === '-') {
        return -1;
      } else if (char === '+') {
        return 1;
      } else {
        return 'digit';
      }
    };

    stringToInteger = function (input) {
      var base = 10;
      var digits = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9
      }
      var charIntegers;

      charIntegers = input.split('').reverse();

      return charIntegers.reduce(function(sum, char, idx) {
        sum += digits[char] * Math.pow(base, idx);
        return sum;
      }, 0);
    };

    stringToSignedInteger = function (input) {
      var firstChar = checkForSign(input.charAt(0));
      if (firstChar === 'digit') {
        return stringToInteger(input);
      } else {
        return firstChar * stringToInteger(input.slice(1));
      }
      /*
        Launch School solution much cleaner:

        switch(input[0])
        case: '-': return stringToInteger(input.slice(1));
        case: '+': return stringToInteger(input.slice(1));
        default: return stringToInteger(input);
      */
    };

    integerToString = function(number) {
      var base = 10;
      var digits = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4',
        5: '5', 6: '6', 7: '7', 8: '8', 9: '9'
      }
      if (number === 0) { return '0'; }
      var highestPower = Math.floor(Math.log10(number));
      var charArray = [];
      for (var powerOfTen = highestPower; powerOfTen > -1; powerOfTen--) {
        var baseNumber = Math.pow(base, powerOfTen);
        var digit = Math.floor(number / baseNumber);
        charArray.push(digits[digit]);
        number = (number % baseNumber);
      };
      return charArray.reduce(function(str, char) { return str += char; }, '');
    }

    signedIntegerToString = function (number) {
      if (number < 0) {
        return '-' + integerToString(Math.abs(number));
      } else if (number > 0) {
        return '+' + integerToString(number);
      } else {
        return '0';
      }
    }
  });

  it('exercise 1: Building Strings', function (done) {
    var line_returns = [...paragraph.matchAll(/sed(\s)+ligula/g)];
    expect(line_returns[0][1]).to.match(/\s/);
    done();
    // text is all on one line, lots of space before lines 2-6
  });

  it('exercise 2: Conditionals Part 1', function (done) {
    expect(myBoolean).to.be.true;
    expect(!myString).to.be.false;
    expect(!!myArray).to.be.true;
    if(myOtherString || myArray) {
      var result = '!';
    }
    expect(result).to.equal('!');
    done();
  });

  it('exercise 3: Conditionals Part 2', function (done) {
    var condition1 = true;
    var condition2 = false;
    var condition4 = false;
    var condition5 = false;
    var branch;

    if (condition1) {
      if (condition2) {
        branch = 'unique path 1';
      } else {
        branch = 'unique path 2';
      }
    } else {
      branch = 'unique path 3';
      if (condition4) {
        branch = 'unique path 4';
        if (condition5) {
        branch = 'unique path 5';
        }
      }
    }
    expect(branch).to.equal('unique path 2');
    /*
    there are five uniqu paths:
    1:  condition 1 -> condition 2
    2:  condition 1 -> not condition 2
    3:  not condition 1
    4:  not condition 1 -> condition 4
    5:  not condition 1 -> condtion 4 -> condition 5
    */
    done();
  });

  it('exercise 4: String Assignment', function (done) {
    var output = stdout.inspectSync(function () {
      var name = 'Bob';
      var saveName = name;
      name = 'Alice';
      console.log(name, saveName);
    });
    var secondOutput = stdout.inspectSync(function () {
      var name = 'Bob';
      var saveName = name;
      name.toUpperCase();
      console.log(name, saveName)
    });
    expect(output).to.deep.equal(['Alice Bob\n']);
    expect(secondOutput).to.deep.equal(['Bob Bob\n']);
    // secondOutput is not [BOB Bob\n] because primitive values are immutable
    done();
  });

  it('exercise 5: Arithmetic Integer', function (done) {
    /*
      in the original problem statement, number1 and number2
      where captured through the prompt() function, which always
      returns values as a string, thus string conversion is needed
      to get the arithmetic operations to perform properly.
    */
    var input1 = '23'; // simulate prompt() input
    var input2 = '17'; // simulate prompt() input
    var number1 = parseInt(input1, 10);
    var number2 = parseInt(input2, 10);
    /*
      we would normally do the following:
      var number1 = parseInt(prompt('Enter the first number: '), 10);
      var number2 = parseInt(prompt('Enter the second number: '), 10);
    */

    var s1 = number1 + ' + ' + number2 + ' = ' + (number1 + number2);
    var e1 = '23 + 17 = 40';

    var s2 = number1 + ' - ' + number2 + ' = ' + (number1 - number2);
    var e2 = '23 - 17 = 6';

    var s3 = number1 + ' * ' + number2 + ' = ' + (number1 * number2);
    var e3 = '23 * 17 = 391';

    var s4 = number1 + ' / ' + number2 + ' = ' + Math.floor(number1 / number2);
    var e4 = '23 / 17 = 1';

    var s5 = number1 + ' % ' + number2 + ' = ' + (number1 % number2);
    var e5 = '23 % 17 = 6';

    var s6 = number1 + ' ** ' + number2 + ' = ' + Math.pow(number1, number2);
    var e6 = '23 ** 17 = 1.4105003956066297e+23';

    expect(s1).to.equal(e1);
    expect(s2).to.equal(e2);
    expect(s3).to.equal(e3);
    expect(s4).to.equal(e4);
    expect(s5).to.equal(e5);
    expect(s6).to.equal(e6);
    done();
  });

  it('exercise 6: Counting the Number of Characters', function (done) {
    var s1 = 'walk';
    var s2 = "walk, don't run";
    var s3 = "walk, foo1 123!"
    s3 = s3.replace(/[\d,!\s]/g, '');

    expect(s1.length).to.equal(4);
    expect(s2.length).to.equal(15);
    expect(s3.length).to.equal(7);
    done();
  });

  it('exercise 7: Convert a String to a Number', function (done) {
    expect(stringToInteger('4321')).to.equal(4321);
    expect(stringToInteger('570')).to.equal(570);
    done();
  });

  it('exercise 8: Convert a String to a Signed Number', function (done) {
    expect(stringToSignedInteger('4321')).to.equal(4321);
    expect(stringToSignedInteger('-570')).to.equal(-570);
    expect(stringToSignedInteger('+100')).to.equal(100);
    done();
  });

  it('exercise 9: Convert a Number to a String', function (done) {
    expect(integerToString(4321)).to.equal('4321');
    expect(integerToString(0)).to.equal('0');
    expect(integerToString(5000)).to.equal('5000');
    done();
  });

  it('exercise 10: Convert a Signed Number to a String', function (done) {
    expect(signedIntegerToString(4321)).to.equal('+4321');
    expect(signedIntegerToString(-123)).to.equal('-123');
    expect(signedIntegerToString(0)).to.equal('0');
    done();
  });
});