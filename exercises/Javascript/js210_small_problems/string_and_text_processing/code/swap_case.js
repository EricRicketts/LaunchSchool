function swapCase(str) {
  let charArr = str.split('');

  return charArr.map(function(char) {
    let noLetter = /[^a-z]/i;
    return !!char.match(noLetter) ? char : swapLetterCase(char)
  }).join('')
}

function swapCaseAlternate(str) {
  let noLettersORLetters = /([^a-zA-Z])|([a-z])|([A-Z])/g;
  return str.replace(noLettersORLetters, function(match, p1, p2, p3) {
    if (!!p1) {
      return p1;
    } else if (!!p2) {
      return p2.toUpperCase();
    } else {
      return p3.toLowerCase();
    }
  })
}
function swapLetterCase(char) {
  return char === char.toUpperCase() ? char.toLowerCase() : char.toUpperCase();
}

export { swapCase, swapCaseAlternate };
