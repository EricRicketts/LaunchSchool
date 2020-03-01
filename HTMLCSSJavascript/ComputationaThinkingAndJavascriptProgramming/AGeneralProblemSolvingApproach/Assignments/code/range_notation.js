function getNextSequenceNumber(currentNumber, priorNumber = 0) {
  let newNumber = Number.parseInt(currentNumber, 10);

  return priorNumber < newNumber ? newNumber : iterateForNextNumber(currentNumber, priorNumber);
}

function iterateForNextNumber(currentNumber, priorNumber) {
  let newNumber = Number.parseInt(currentNumber, 10);
  let originalCurrentNumber = Number.parseInt(currentNumber, 10);
  let exponent = currentNumber.length;
  let powerOfTen = Math.pow(10, exponent);
  let numberFound;

  while (true) {
    newNumber += powerOfTen;
    numberFound = (newNumber > priorNumber) && (newNumber % powerOfTen === originalCurrentNumber);
    if (numberFound) { break; }
  }

  return newNumber;
}

function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

function shortHandRangeToArray(rangeString) {
  const comma = /,\s*/;
  const rangeSeparators = /[:\-]|\.{2}/;

}

export { shortHandRangeToArray, range, getNextSequenceNumber };