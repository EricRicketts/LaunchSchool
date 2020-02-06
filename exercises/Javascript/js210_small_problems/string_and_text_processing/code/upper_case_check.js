function extractLetters(str) {
  const LETTERS_ONLY = /[a-zA-Z]/;

  return str.split('').filter((char) => !!char.match(LETTERS_ONLY) );
}

function isLetterUppercase(char) {
  return char === char.toUpperCase();
}

function isUppercase(str) {
  return extractLetters(str).every(isLetterUppercase);
}

function isUppercaseLaunchSchool(str) {
  const LOWERCASE_LETTERS = /[a-z]/;

  return !LOWERCASE_LETTERS.test(str);
}

export { isUppercase, isUppercaseLaunchSchool };
/*
In the Launch School solution if there is any lowercase
letter in the string then test() will return true which
will be complemented to false
 */