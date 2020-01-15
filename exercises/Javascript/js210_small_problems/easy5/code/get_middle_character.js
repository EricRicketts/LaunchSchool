function centerOf(str) {
  var centerIdx = Math.floor(str.length/2);

  return isOdd(str.length) ? str.slice(centerIdx, centerIdx + 1) : str.slice(centerIdx - 1, centerIdx + 1);
}

function isOdd(num) {
  return num % 2 === 1;
}

export { centerOf };