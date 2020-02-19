function rotateArray(originalArr) {
  if (!Array.isArray(originalArr)) {
    return undefined;
  }
  let originalArrSize = originalArr.length;
  let rotatedArr = [...new Array(originalArrSize)];

  return rotatedArr.map((_, idx) => {
    let rotatedIndex = (idx + 1 + originalArrSize) % originalArrSize;
    return originalArr[rotatedIndex];
  });
}

export { rotateArray };