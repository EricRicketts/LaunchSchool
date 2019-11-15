function lowerCaseChar(char) {
  var offset = 32;
  var lowerBound = 65;
  var upperBound = 90;
  var asciiNumeric = char.charCodeAt(0);

  if (asciiNumeric >= lowerBound && asciiNumeric <= upperBound) {
    return String.fromCharCode(asciiNumeric + offset);
  } else {
    return char;
  }
}

function toLowerCase(str) {
  var lowerCase = '';

  for(var i = 0; i < str.length; i++) {
    lowerCase += lowerCaseChar(str[i]);
  }

  return lowerCase;
}