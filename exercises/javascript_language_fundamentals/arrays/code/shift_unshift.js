function shift(arr) {
  var val = arr[0];
  var arrLength = arr.length;
  var lastIndex = arrLength - 1;

  for (var i = 0; (i + 1) <= arrLength; i += 1) {
    arr[i] = arr[i + 1];
  }
  
  if (lastIndex >= 0) { arr.length = lastIndex; }
  return val;
}

function unshift(arr, ...args) {
  var argLength = args.length;
  var newArrLength = arr.length + argLength;
  var lastIndex = newArrLength - 1;
  var insertionIndex = lastIndex - argLength;
  arr.length = newArrLength;
  
  for (var i = lastIndex; i >= 0; i -= 1) {
    i > insertionIndex ? arr[i] = arr[i - argLength] : arr[i] = args[i];
  }

  return arr.length;
}

export { shift, unshift };