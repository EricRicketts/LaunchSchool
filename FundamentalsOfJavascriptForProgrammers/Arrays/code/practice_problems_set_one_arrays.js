function concatValues(arr) {
  var str = '';
  var lastIndex = arr.length - 1;

  for(var i = 0; i <= lastIndex; i++) {
    str += String(arr[i]);
  }

  return str;
}

function findValIn(arr, value) {
  var indexValue = -1;
  var lastIndex = arr.length - 1;

  for(var i = 0; i <= lastIndex; i++) {
    if (arr[i] === value) {
      indexValue = i;
      break;
    }
  }

  return indexValue;
}

function lastInArray(arr) {
  var lastIndex = arr.length - 1;
  return arr[lastIndex];
}

function reverse(arr) {
  var lastIndex = arr.length - 1;
  var reversedArr = [];

  for(var i = lastIndex; i >= 0; i--) {
    reversedArr.push(arr[i]);
  }

  return reversedArr;
}

function rollCall(arr) {
  var str = '';
  var arrSize = arr.length;

  for(var i = 0; i < arrSize; i++) {
    str += arr[i] + '\n';
  }

  return str;
}