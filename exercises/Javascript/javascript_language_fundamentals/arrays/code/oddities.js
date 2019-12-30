function compareArrays(arr1, arr2) {
  var compareResult = true;
  var arrLength = arr1.length;

  if (arr1.length !== arr2.length) { return false; }

  for (var i = 0; i < arrLength; i += 1) {
    if (arr1[i] !== arr2[i]) {
      compareResult = false;
      break;
    }
  }

  return compareResult;
}
function oddities(array) {
  var oddElements = [];
  var i;

  for (i = 0; i < array.length; i += 2) {
    oddElements.push(array[i]);
  }

  return oddElements;
}

export { oddities, compareArrays };