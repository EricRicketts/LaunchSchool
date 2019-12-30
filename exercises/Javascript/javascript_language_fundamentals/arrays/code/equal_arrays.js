function areArraysEqual(arr1, arr2) {
  var copyAry2 = arr2.slice();
  var copyAry1 = arr1.slice();
  var compareElement;
  var compareIndex;
  var compareResult = true;

  if (arr1.length !== arr2.length) { return false; }

  while (copyAry1.length !== 0) {
    compareElement = copyAry1.pop();
    compareIndex = copyAry2.indexOf(compareElement);
    if (compareIndex !== -1) {
      copyAry2.splice(compareIndex, 1);
    } else {
      compareResult = false;
      break;
    }
  }

  return compareResult;
}

export { areArraysEqual };