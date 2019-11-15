function convertChar(char, cipherOffset) {
  var alphabetSize = 26;
  var lowerCaseOffset = 97;
  var upperCaseOffset = 65;
  var reLowerCase = /[a-z]/;

  var asciiOffset = reLowerCase.test(char) ? lowerCaseOffset : upperCaseOffset;
  var asciiNumber = ((char.charCodeAt() - asciiOffset + cipherOffset) % alphabetSize) + asciiOffset;

  return String.fromCharCode(asciiNumber);
}

function rot13(str) {
  var strSize = str.length;
  var offset = 13;
  var convertedChar = '';
  var codedString = '';
  var re = /[A-Za-z]/;

  for(var i = 0; i < strSize; i++) {
    convertedChar = re.test(str[i]) ? convertChar(str[i], offset) : str[i];
    codedString += convertedChar;
  }

  return codedString;
}