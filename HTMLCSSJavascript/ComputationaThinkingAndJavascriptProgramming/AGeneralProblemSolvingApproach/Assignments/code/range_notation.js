function addToFinalSequence(sequence, element, idx) {
  let rangeOrNumber, priorNumber, lastIdx;
  if (idx === 0) {
    rangeOrNumber = Array.isArray(element) ? processRange(element) : Number.parseInt(element, 10);
  } else {
    lastIdx = sequence.length - 1;
    priorNumber = sequence[lastIdx];
    rangeOrNumber = Array.isArray(element) ? processRange(element, priorNumber) : getNextSequenceNumber(element, priorNumber);
  }
  Array.isArray(rangeOrNumber) ? sequence.push(...rangeOrNumber) : sequence.push(rangeOrNumber);
  return sequence;
}

function generateRangeFromShortHandNotation(firstEndPoint, currentEndPoint) {
  let secondEndPoint = getNextSequenceNumber(currentEndPoint, firstEndPoint);
  // avoid duplicating the last element of the prior range
  return range(firstEndPoint, secondEndPoint).slice(1);
}

function getNextSequenceNumber(currentNumber, priorNumber = 0) {
  let nextNumber = Number.parseInt(currentNumber, 10);

  return priorNumber < nextNumber ? nextNumber : iterateForNextNumber(currentNumber, priorNumber);
}

function iterateForNextNumber(currentNumber, priorNumber) {
  let nextNumber = Number.parseInt(currentNumber, 10);
  let powerOfTen = Math.pow(10, currentNumber.length); // number of digits is the exponent
  let numberFound;

 do {
   nextNumber += powerOfTen;
   numberFound = nextNumber > priorNumber && nextNumber % powerOfTen === Number.parseInt(currentNumber, 10);
 }  while (!numberFound);

  return nextNumber;
}

function processRange(rangeArray, priorNumber = 0) {
  let finalRange = [];
  let firstEndPoint, lastRangeIdx;

  rangeArray.forEach((currentEndPoint, idx) => {
    if (idx === 0) {
      finalRange.push(getNextSequenceNumber(currentEndPoint, priorNumber));
    } else {
      lastRangeIdx = finalRange.length - 1;
      firstEndPoint = finalRange[lastRangeIdx];
      finalRange.push(...generateRangeFromShortHandNotation(firstEndPoint, currentEndPoint));
    }
  });

  return finalRange;
}

function range(start, end, length = end - start + 1) {
  return Array.from({ length }, (_, i) => start + i);
}

function shortHandRangeToArray(rangeString) {
  const comma = /,\s*/;
  const rangeSeparators = /[:\-]|\.{2}/;

  let formattedSequence = rangeString.split(comma).map((str) => {
    return rangeSeparators.test(str) ? str.split(rangeSeparators) : str;
  });

  return formattedSequence.reduce((sequence, element, idx) => addToFinalSequence(sequence, element, idx), []);
}

export { shortHandRangeToArray, range, getNextSequenceNumber, processRange };