function reverseNumber(num) {
  var initialReverse = num.toString().split('').reverse().join('');
  var leadingZeros = /^0+/;
  var finalReverse = initialReverse.replace(leadingZeros, '');

  return Number.parseInt(finalReverse, 10);
}

export { reverseNumber };