function crunch(str) {
  return str.replace(/(.)\1+/g, '$1');
}

function crunchManual(str) {
  var strippedStr = '';
  var strSize = str.length;
  var lastChar = str[strSize - 1] || '';

  for(var i = 1; i < strSize; i++) {
    var previousChar = str[i - 1];
    var currentChar = str[i];
    if (currentChar === previousChar) {
      continue;
    } else {
      strippedStr += previousChar;
    }
  }

  return strippedStr + lastChar;
}

function findFibonacciIndexByLength(numDigits) {
  var targetNum = 10**(numDigits - 1);
  var fibArr = [1, 1];
  var fibNum;

  while(true) {
    var lastNumber = fibArr[fibArr.length - 1];
    var nextToLastNumber = fibArr[fibArr.length - 2];
    fibNum = nextToLastNumber + lastNumber;

    fibArr.push(fibNum);
    if (fibNum >= targetNum) { break; }
  }

  return fibArr.indexOf(fibNum) + 1;
}

function getGrades(...args) {
  var avg = args.reduce((sum, grade) => sum += grade) / args.length;
  var grade;

  if (avg >= 90 && avg <= 100) {
    grade = 'A';
  } else if (avg >= 80 && avg < 90) {
    grade = 'B';
  } else if (avg >= 70 && avg < 80) {
    grade = 'C';
  } else if (avg >= 60 && avg < 70) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  return grade;
}

function isDouble(number) {
  var str = String(number);
  var strSize = str.length;
  var firstHalf = '';
  var secondHalf = '';

  for(var i = 0; i < strSize/2; i++) {
    firstHalf += str[i];
    secondHalf += str[strSize/2 + i];
  }

  return firstHalf === secondHalf;
}

function isEven(n) {
  return n % 2 === 0;
}

function isEvenDigits(number) {
  return (String(number).length % 2 === 0);
}

function logInBox(str) {
  return topAndBottomRows(str) +
    secondAndFourthRows(str) +
    middleRow(str) +
    secondAndFourthRows(str) +
    topAndBottomRows(str);
}

function madlibs(noun, verb, adjective, adverb) {
  return 'Do you ' + verb + ' your ' + adjective + ' ' +
    noun + ' ' + adverb + '?' + "  That's hilarious!\n"
}

function middleRow(str) {
  return '| ' + str + ' |\n';
}

function secondAndFourthRows(str) {
  return '| ' + ' '.repeat(str.length) + ' |\n';
}

function stringy(bits) {
  return [...Array(bits).keys()].map(n => isEven(n) ? "1" : "0" ).join('');
}

function topAndBottomRows(str) {
  return '+-' + '-'.repeat(str.length) + '-+\n';
}

function triangle(sides) {
  var rt = '';
  for(var i = 1; i <= sides; i++) {
    rt += ' '.repeat(sides - i) + '*'.repeat(i) + '\n';
  }

  return rt;
}

function twice(number) {
  return isEvenDigits(number) && isDouble(number) ? number : 2*number;
}