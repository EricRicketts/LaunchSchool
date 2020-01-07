function invoiceTotalFirst(amount1, amount2, amount3, amount4) {
  return amount1 + amount2 + amount3 + amount4;
}

function invoiceTotalSecond() {
  var numArgs = arguments.length;
  var sum = 0;

  for (let i = 0; i < numArgs; i += 1) {
    sum += arguments[i];
  }

  return sum;
}
export { invoiceTotalFirst, invoiceTotalSecond };