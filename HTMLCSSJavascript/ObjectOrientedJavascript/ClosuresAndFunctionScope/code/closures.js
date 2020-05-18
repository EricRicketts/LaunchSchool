function later(func, string) {
  return function() {
    return func.call(string);
  }
}

function makeMultipleLister(stepSize) {
  const limit = 100;
  return function() {
    let rangeOfNumbers = [];
    for (let i = stepSize; i < limit; i += stepSize) {
      rangeOfNumbers.push(i);
    }
    return rangeOfNumbers;
  }
}

export { later, makeMultipleLister };