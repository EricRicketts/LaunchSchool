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

function processRange(rangeArray, priorNumber = 0) {
  let finalRange = [];
  let firstEndPoint, secondEndPoint, lastRangeIdx, additionalRangeBeyondTwoEndPoints;

  rangeArray.forEach((currentEndPoint, idx) => {
    if (idx === 0) {
     firstEndPoint = getNextSequenceNumber(currentEndPoint, priorNumber);
    } else if (idx === 1) {
      secondEndPoint = getNextSequenceNumber(currentEndPoint, firstEndPoint);
      finalRange.push(...range(firstEndPoint, secondEndPoint));
    } else {
      lastRangeIdx = finalRange.length - 1;
      firstEndPoint = finalRange[lastRangeIdx];
      secondEndPoint = getNextSequenceNumber(currentEndPoint, firstEndPoint);
      // below we avoid duplicating the last element of the prior range
      additionalRangeBeyondTwoEndPoints = range(firstEndPoint, secondEndPoint).slice(1);
      finalRange.push(...additionalRangeBeyondTwoEndPoints);
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

  let formattedSequence = rangeString.split(comma).map((str) => rangeSeparators.test(str) ? str.split(rangeSeparators) : str);
  return formattedSequence.reduce((sequence, element, idx) => {
    let rangeOrNumber, priorNumber, lastIdx;
    if (idx === 0) {
      rangeOrNumber = Array.isArray(element) ? processRange(element) : Number.parseInt(element, 10);
      Array.isArray(rangeOrNumber) ? sequence.push(...rangeOrNumber) : sequence.push(rangeOrNumber);
    } else {
      lastIdx = sequence.length - 1;
      priorNumber = sequence[lastIdx];
      rangeOrNumber = Array.isArray(element) ? processRange(element, priorNumber) : getNextSequenceNumber(element, priorNumber);
      Array.isArray(rangeOrNumber) ? sequence.push(...rangeOrNumber) : sequence.push(rangeOrNumber);
    }

    return sequence;
  }, []);
}

export { shortHandRangeToArray, range, getNextSequenceNumber, processRange };