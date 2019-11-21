function lastIndexOf(arr, value) {
  var lastIndex = -1;
  var arrSize = arr.length;

  for(var i = arrSize - 1; i >= 0; i--) {
    if (arr[i] === value) {
      lastIndex = i;
      break;
    }
  }

  return lastIndex;
}

function indexOf(arr, value) {
  var firstIndex = -1;
  var arrSize = arr.length;

  for(var i = 0; i < arrSize; i++) {
    if (arr[i] === value) {
      firstIndex = i;
      break;
    }
  }

  return firstIndex;
}