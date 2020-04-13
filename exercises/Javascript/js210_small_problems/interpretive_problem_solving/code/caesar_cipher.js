function caesarEncrypt(phrase, key) {
  const letterRegex = /([A-Z])|([a-z])/g;

  return phrase.replace(letterRegex, encryptLetter(key))
}

function encryptLetter(key) {
  const numberOfLetters = 26;
  const upperCaseStartCodePoint = 65;
  const lowerCaseStartCodePoint = 97;

  return (match, upperCase) => {
    let offset = upperCase ? upperCaseStartCodePoint : lowerCaseStartCodePoint;
    let normalizedCodePoint = (match.charCodeAt(0) - offset + key) %  numberOfLetters;

    return String.fromCodePoint(offset + normalizedCodePoint);
  }
}

export { caesarEncrypt };