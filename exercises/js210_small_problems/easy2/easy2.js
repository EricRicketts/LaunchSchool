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

function logInBox(str) {
  return topAndBottomRows(str) +
    secondAndFourthRows(str) +
    middleRow(str) +
    secondAndFourthRows(str) +
    topAndBottomRows(str);
}

function middleRow(str) {
  return '| ' + str + ' |\n';
}

function secondAndFourthRows(str) {
  return '| ' + ' '.repeat(str.length) + ' |\n';
}

function topAndBottomRows(str) {
  return '+-' + '-'.repeat(str.length) + '-+\n';
}