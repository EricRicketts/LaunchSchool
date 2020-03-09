function allDigitsUnique(number) {
  let numString = number.toString();
  let numStringSize = numString.length;

  for (let i = 0; i < numStringSize; i += 1) {
    let digitRegex = new RegExp(numString[i], 'g');
    if (numString.match(digitRegex).length > 1) {
      return false;
    }
  }
  return true;
}

function featured(number) {
  const largestFeaturedNumber = 9876543201;
  let nextNumber = number + 1;

  while (!isFeatured(nextNumber) && nextNumber <= largestFeaturedNumber) {
    nextNumber += 1;
  }

  return nextNumber;
}

function isFeatured(number) {
  return isOdd(number) && isMultipleOfSeven(number) && allDigitsUnique(number);
}

function isMultipleOfSeven(number) {
  return number % 7 === 0;
}

function isOdd(number) {
  return number % 2 === 1;
}

export { featured };