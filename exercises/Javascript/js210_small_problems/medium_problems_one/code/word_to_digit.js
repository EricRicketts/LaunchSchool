function replaceWordWithNumber(match) {
  const wordsToNumbers = {
    zero: 0, one: 1, two: 2, three: 3, four: 4,
    five: 5, six: 6, seven: 7, eight: 8, nine: 9,
  };

  return wordsToNumbers[match].toString();
}

function wordToDigit(phrase) {
  const numberRegex = /\b(zero|one|two|three|four|five|six|seven|eight|nine)\b/g;

  return phrase.replace(numberRegex, replaceWordWithNumber);
}

export { wordToDigit };