function isEven(number) {
  return number % 2 === 0;
}

function isValidLuhnNumber(luhnNumber) {
  const CHECKSUM_MODULUS = 10;
  const NON_NUMERIC_REGEX = /\D+/g;
  let cleanLuhnNumber = luhnNumber.replace(NON_NUMERIC_REGEX, '');
  let digitsArr = cleanLuhnNumber.split('').reverse();

  if (digitsArr.length === 0) { return false; }

  let checkSumArr = digitsArr.map((digitChar, idx) => {
    return isEven(idx) ? digitChar : transformOddDigit(digitChar);
  });

  let checkSum = checkSumArr.reduce((sum, digitChar) =>  sum + Number.parseInt(digitChar, 10), 0);

  return checkSum % CHECKSUM_MODULUS === 0;
}

function transformOddDigit(digitChar) {
  let number = Number.parseInt(digitChar, 10);
  let twiceNumber = 2 * number;
  const NORMALIZER = 9;

  return !(twiceNumber > NORMALIZER) ? twiceNumber.toString() : (twiceNumber - NORMALIZER).toString();
}

export { isValidLuhnNumber }