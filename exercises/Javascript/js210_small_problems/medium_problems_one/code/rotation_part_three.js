import { rotateArray } from "./rotation_part_one_a";

function maxRotation(number) {
  let numStrArr = [...number.toString(10)]; // array of digits each of which is a string
  let numStrArrSize = numStrArr.length;
  let idxArr = [...Array.from({ length: numStrArrSize }).keys()];
  // array of indices used to separate non rotated part of array from rotated part of array

  let maxRotationArr =  idxArr.reduce(function(rotatedArr, idx) {
      let nonRotatedSlice = rotatedArr.slice(0, idx);
      let rotatedSlice = rotateArray(rotatedArr.slice(idx));
      return nonRotatedSlice.concat(rotatedSlice);
  }, numStrArr);

  return Number.parseInt(maxRotationArr.join(''), 10);
}

export { maxRotation };