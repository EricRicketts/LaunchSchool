import { isValidLuhnNumber, generateLuhnChecksum } from "./luhn_number";

function generateLuhnNumber(luhnNumber) {
  const REQUIRED_MODULUS = 10;
  let paddedLuhnNumber = luhnNumber.concat('0');
  let digitsArr = paddedLuhnNumber.split('').reverse();
  let checkSum = generateLuhnChecksum(digitsArr);

  let extraDigit = Math.abs((checkSum % REQUIRED_MODULUS) - REQUIRED_MODULUS);
  return luhnNumber.concat(extraDigit.toString());
}

function generateLuhnNumberAlternate(luhnNumber) {
  const extraDigits = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const potentialLuhnNumbers = extraDigits.map((digit) => luhnNumber.concat(digit));

  return potentialLuhnNumbers.find((number) => isValidLuhnNumber(number));
}

function luhnCheckSumNumber(luhnNumber) {
  return isValidLuhnNumber(luhnNumber) ? luhnNumber : generateLuhnNumber(luhnNumber);
}

function luhnCheckSumNumberAlternate(luhnNumber) {
  return isValidLuhnNumber(luhnNumber) ? luhnNumber : generateLuhnNumberAlternate(luhnNumber);
}

export { luhnCheckSumNumber, luhnCheckSumNumberAlternate };
/*
In this case I am assuming there are always digits coming in no need to check for
bad input
 */