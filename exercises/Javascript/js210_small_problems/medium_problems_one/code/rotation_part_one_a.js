function rotateArray(originalArray, iterations = 1) {
  if (!Array.isArray(originalArray)) {
    return undefined;
  }
  let originalArraySize = originalArray.length, rotatedArray = [...new Array(originalArraySize)];

  return rotatedArray.map((_, idx) => {
    let rotatedIdx = (idx + iterations + originalArraySize) % originalArraySize;
    return originalArray[rotatedIdx];
  });
}

export { rotateArray };