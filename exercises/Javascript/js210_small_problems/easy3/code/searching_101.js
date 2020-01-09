function searching() {
  var lastIndex = arguments.length - 1;
  var lastNumber = arguments[lastIndex];
  var numbers = [];
  var numStr;
  var found;
  var notFound;
  for (let i = 0; i < lastIndex; i += 1) {
    numbers.push(arguments[i]);
  }
  numStr = '[' + numbers.join(', ') + ']';

  found = 'The number ' + lastNumber + ' appears in ' + numStr + '.';
  notFound = 'The number ' + lastNumber + ' does not appear in ' + numStr + '.';
  return numbers.some(n => n === lastNumber) ? found : notFound;
}

export { searching };