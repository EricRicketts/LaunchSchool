function multiplyString(str, n) {
  var multipliedString = '';

  for(var i = 0; i < n; i++) {
    multipliedString += str;
  }

  return multipliedString;
}

function repeat(str, n) {
  var repeatedString;

  if ((typeof n !== 'number') || n < 0 || !Number.isFinite(n)) {
    repeatedString = undefined;
  } else {
    repeatedString = multiplyString(str, n);
  }

  return repeatedString;
}
