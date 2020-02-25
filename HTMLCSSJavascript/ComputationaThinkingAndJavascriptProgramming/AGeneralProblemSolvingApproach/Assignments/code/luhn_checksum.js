import { isValidLuhnNumber, generateLuhnChecksum } from "./luhn_number";

function generateLuhnNumber(luhnNumber) {
  const REQUIRED_MODULUS = 10;
  let paddedLuhnNumber = luhnNumber.concat('0');
  let digitsArr = paddedLuhnNumber.split('').reverse();
  let checkSum = generateLuhnChecksum(digitsArr);

  let extraDigit = Math.abs((checkSum % REQUIRED_MODULUS) - REQUIRED_MODULUS);
  return luhnNumber.concat(extraDigit.toString());
}

function luhnCheckSumNumber(luhnNumber) {
  return isValidLuhnNumber(luhnNumber) ? luhnNumber : generateLuhnNumber(luhnNumber);
}

export { luhnCheckSumNumber };
/*
In this case I am assuming there are always digits coming in
 */