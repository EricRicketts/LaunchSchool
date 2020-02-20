import { rotateArray } from "./rotation_part_one_a";

function rotateRightMostDigits(number, numberOfDigitsToRotate) {
  let numStrArr = [...number.toString(10)];
  let numStrArrSize = numStrArr.length;
  let rotatedArrStartIndex = numStrArrSize - numberOfDigitsToRotate; // start from last digit of number

  let rotatedArr = rotateArray(numStrArr.slice(rotatedArrStartIndex));
  let nonRotatedArr = numStrArr.slice(0, rotatedArrStartIndex);
  let rotatedStr = nonRotatedArr.join('') + rotatedArr.join('');

  return Number.parseInt(rotatedStr, 10);
}

export { rotateRightMostDigits };