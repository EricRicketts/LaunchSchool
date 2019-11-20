function pop(arr) {
  var lastIndex = arr.length - 1;
  var lastValue = arr[lastIndex];
  arr.length = lastIndex;

  return lastValue;
}

function push(arr, value) {
  var newIndex = arr.length;
  arr[newIndex] = value;
  return arr.length;
}

function shift(arr) {
  var firstValue = arr[0];
  var lastIndex = arr.length - 1;

  if (arr.length === 0) {
    return undefined;
  }

  for(var i = 0; i < arr.length; i++) {
    arr[i] = arr[i + 1];
  }

  arr.length = lastIndex;
  return firstValue;
}

function unshift(arr, value) {
  for(var i = arr.length; i > 0; i--) {
    arr[i] = arr[i - 1];
  }

  arr[0] = value;
  return arr.length;
}