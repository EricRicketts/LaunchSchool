function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

function squareOfSum(limit) {
  let sum = range(1, limit).reduce((sum, n) => sum + n, 0);

  return Math.pow(sum, 2);
}

function sumOfSquares(limit) {
  return range(1, limit).reduce((summingSquares, n) => summingSquares + Math.pow(n, 2), 0 )
}

function sumSquareDifference(limit) {
  return squareOfSum(limit) - sumOfSquares(limit);
}

export { sumSquareDifference };