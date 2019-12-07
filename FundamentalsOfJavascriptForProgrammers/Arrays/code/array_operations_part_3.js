function concat(arr1, arr2) {
  var concatedArr = [];
  var arr1Size = arr1.length;
  var arr2Size = arr2.length;
  var arr1And2Size = arr1Size + arr2Size;

  for(var i = 0; i < arr1And2Size; i++) {
    if (i >= arr1Size) {
      concatedArr.push(arr2[i - arr1Size]);
    } else {
      concatedArr.push(arr1[i]);
    }
  }

  return concatedArr;
}

function join(arr, separator) {
  var returnStr = '';
  var lastIndex = arr.length - 1;

  for(var i = 0; i <= lastIndex; i++) {
    if (i < lastIndex) {
      returnStr += String(arr[i]) + separator;
    } else {
      returnStr += String(arr[i]);
    }
  }

  return returnStr;
}

function slice(arr, firstIndex, lastIndex) {
  var arrSize = arr.length;
  var slicedArr = [];
  if (lastIndex === undefined) {
    lastIndex = arrSize - 1;
  }

  for(var i = firstIndex; i < lastIndex; i++) {
    slicedArr.push(arr[i]);
  }

  return slicedArr;
}

function splice(arr, firstIndex, noValues) {
  var arrSize = arr.length;
  var tempArr = [];
  var splicedResults = [];
  var lastIndex = firstIndex + noValues - 1;

  for(var i = 0; i < arrSize; i++) {
    if (i >= firstIndex && i <= lastIndex) {
      splicedResults.push(arr[i]);
    } else {
      tempArr.push(arr[i]);
    }
  }

  for(var i = 0; i < tempArr.length; i++) {
    arr[i] = tempArr[i];
  }
  arr.length = arr.length - splicedResults.length;

  return splicedResults;
}