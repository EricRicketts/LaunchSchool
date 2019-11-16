function collectEvenNumbersTo(last) {
  var arr = [...Array(last).keys()].map(n => n + 1);
  return arr.filter(n => isEven(n));
}

function collectOddNumbersTo(last) {
  var arr = [...Array(last).keys()].map(n => n + 1);
  return arr.filter(n => isOdd(n));
}

function isEven(n) {
  return (n % 2 === 0);
}

function isOdd(n) {
  return (n % 2 === 1);
}