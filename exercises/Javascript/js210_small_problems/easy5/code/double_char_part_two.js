function doubleConsonants(str) {
  var consonantUpperCase = /[B-DF-HJ-NP-TV-Z]/;
  var consonantLowerCase = /[b-df-hj-np-tv-z]/;
  var repeatedStr = '';
  var charArr = str.split('');

  charArr.forEach(function(char) {
    if (char.match(consonantUpperCase) || char.match(consonantLowerCase)) {
      repeatedStr += char.repeat(2);
    } else {
      repeatedStr += char;
    }
  });

  return repeatedStr;
}

export { doubleConsonants };