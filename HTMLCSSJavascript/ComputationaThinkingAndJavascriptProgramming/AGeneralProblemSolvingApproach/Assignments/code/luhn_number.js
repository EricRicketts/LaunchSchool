function isEven(number) {
  return number % 2 === 0;
}

function isNumericInput(luhnNumber) {
  const NON_NUMERIC_REGEX = /\D+/g;
  let cleanLuhnNumber = luhnNumber.replace(NON_NUMERIC_REGEX, '');

  return cleanLuhnNumber.split('').reverse();
}

function generateLuhnChecksum(digitsArr) {
  let checkSumArr = digitsArr.map((digitChar, idx) => {
    let digit =  Number.parseInt(digitChar, 10);
    return isEven(idx) ? digit : transformOddDigit(digit);
  });

  return checkSumArr.reduce((sum, digit) =>  sum + digit, 0);
}

function isValidLuhnNumber(luhnNumber) {
  const CHECKSUM_MODULUS = 10;
  let luhnDigitsArr = isNumericInput(luhnNumber);

  if (luhnDigitsArr.length === 0) { return false; }
  return generateLuhnChecksum(luhnDigitsArr) % CHECKSUM_MODULUS === 0;
}

function transformOddDigit(number) {
  const TWICE_NUMBER = 2 * number;
  const NORMALIZER = 9;
  const MODULUS = NORMALIZER + 1;

  return TWICE_NUMBER < MODULUS ? TWICE_NUMBER : TWICE_NUMBER - NORMALIZER;
}

export { isValidLuhnNumber }