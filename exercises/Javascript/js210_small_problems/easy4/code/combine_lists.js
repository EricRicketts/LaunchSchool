function interleave(arr1, arr2) {
  var interleavedArr = [];
  var lastIdx = arr1.length - 1;

  for (let i = 0; i <= lastIdx; i += 1) {
    interleavedArr.push(arr1[i], arr2[i]);
  }

  return interleavedArr;
}

export { interleave };