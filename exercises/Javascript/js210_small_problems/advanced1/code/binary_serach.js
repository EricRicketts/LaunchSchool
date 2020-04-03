function binarySearch(arr, searchValue, offset = 0) {
  let middleIndex = Math.floor(arr.length/2);
  let middleValue = arr[middleIndex];
  if (searchValue === middleValue) {
    let foundIndex = findElementIndex(arr, searchValue);
    return offset + foundIndex;
  }  else if (searchValue !== middleValue && arr.length === 1) {
    return -1;
  } else {
    if (middleValue < searchValue) {
      return binarySearch(arr.slice(middleIndex + 1), searchValue, offset + middleIndex + 1);
    } else {
      return binarySearch(arr.slice(0, middleIndex), searchValue, offset);
    }
  }
}

function findElementIndex(arr, value) {
  let arrSize = arr.length;
  let idx;

  for (idx = 0; idx < arrSize; idx += 1) { if (value === arr[idx]) break; }
  return idx;
}

export { binarySearch };