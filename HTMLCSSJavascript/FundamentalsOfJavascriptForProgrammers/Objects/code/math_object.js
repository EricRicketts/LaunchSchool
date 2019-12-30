function getRandomInclusive(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random()*(Math.abs(max - min) + 1)) + Math.min(min, max);
}

function radiansToDegrees(rads) {
  return rads*(180/Math.PI);
}

function toNegative(num) {
  return num === Math.abs(num) ? -1*num : num;
}

export { getRandomInclusive, radiansToDegrees, toNegative };