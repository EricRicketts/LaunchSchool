function isLetter(char) {
  const LETTERS = /[a-zA-Z]/;
  return LETTERS.test(char);
}

function staggeredCase(str) {
  let upCase = true;
  let charArr = str.split('');

  return charArr.map(function(char) {
    if (isLetter(char)) {
       let staggeredChar = upCase ? char.toUpperCase() : char.toLowerCase();
       upCase = !upCase;
       return staggeredChar;
    } else {
      return char;
    }
  }).join('');
}

export { staggeredCase };