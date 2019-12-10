function pop(arr) {
  var lastIndex = arr.length - 1;
  var poppedValue = arr[lastIndex];
  if (lastIndex >= 0) { arr.length = lastIndex; }
  
  return poppedValue;
}

function push(arr, ...args) {
  args.forEach(element => {
    arr[arr.length] = element
  });

  return arr.length;
}

export { pop, push };