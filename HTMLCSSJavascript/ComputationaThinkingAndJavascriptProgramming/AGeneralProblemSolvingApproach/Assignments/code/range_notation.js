function addToFinalSequence(priorNumber, currentNumber, finalSequence) {
  if (priorNumber < currentNumber) {
    finalSequence.push(currentNumber);
  } else {
    finalSequence.push(increaseNumberBySomePowerOfTen(priorNumber, currentNumber));
  }
}

function increaseNumberBySomePowerOfTen(priorNumber, currentNumber) {
  let exponent = Math.floor(Math.log10(currentNumber)) + 1;
  let PowerOfTenIncrementer = Math.pow(10, exponent);

  while (currentNumber < priorNumber) { currentNumber += PowerOfTenIncrementer; }
  return currentNumber;
}

function processNumericSequence(arrOfNumericStrings) {
  let numericArray = arrOfNumericStrings.map((numericString) => Number.parseInt(numericString, 10));
  let finalSequence = [];
  numericArray.forEach((currentNumber, idx) => {
    let priorNumber = idx === 0 ? 0 : finalSequence[idx - 1];
    addToFinalSequence(priorNumber, currentNumber, finalSequence);
  });

  return finalSequence;
}

function processRange(arrOfNumericStrings) {

}

function shortHandRangeToArray(rangeString) {
  const comma = /,\s*/;
  const rangeSeparators = /[:\-]|\.{2}/;

  let parsedNumbersAndRanges = rangeString.split(comma).map((str) => str.split(rangeSeparators));

  let arrOfNumericStrings = parsedNumbersAndRanges.map((arrOfNumericStrings) => {
    return arrOfNumericStrings.length > 1 ? processRange(arrOfNumericStrings) : arrOfNumericStrings;
  }).flat();

  return processNumericSequence(arrOfNumericStrings)
}

export { shortHandRangeToArray };