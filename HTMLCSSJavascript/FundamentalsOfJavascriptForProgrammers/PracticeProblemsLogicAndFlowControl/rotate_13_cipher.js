function convertChar(char, cipherOffset) {
  var ALPHABETSIZE = 26;
  var LOWERCASEOFFSET = 97;
  var UPPERCASEOFFSET = 65;
  var RELOWERCASE = /[a-z]/;

  var asciiOffset = RELOWERCASE.test(char) ? LOWERCASEOFFSET : UPPERCASEOFFSET;
  var asciiNumber = ((char.charCodeAt() - asciiOffset + cipherOffset) % ALPHABETSIZE) + asciiOffset;

  return String.fromCharCode(asciiNumber);
}

function rot13(str) {
  var strSize = str.length;
  var offset = 13;
  var convertedChar = '';
  var codedString = '';
  var reUpperAndLowerCase = /[A-Za-z]/;

  for(var i = 0; i < strSize; i++) {
    convertedChar = reUpperAndLowerCase.test(str[i]) ? convertChar(str[i], offset) : str[i];
    codedString += convertedChar;
  }

  return codedString;
}