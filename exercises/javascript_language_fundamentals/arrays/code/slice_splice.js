function assignSliceArgs(args) {
  var arr = args[0];
  var numberArgs = args.length;

  switch (numberArgs) {
    case 1:
      return [arr, 0, args[0].length];
    case 2:
      return assignTwoSliceArgs(arr, args[1]);
    case 3:
      return assignThreeSliceArgs(arr, args[1], args[2])
    default:
      return assignThreeSliceArgs(arr, args[1], args[2]);
  }
}

function assignThreeSliceArgs(arr, start, end) {
  var arrLength = arr.length;

  if (end === undefined) {
    if (typeof(start) !== 'number' || (typeof(start) === 'number' && isNaN(start))) {
      return [arr, 0, arr.length];
    } else {
      return assignTwoSliceArgs(arr, start);
    }
  } else if (isNumberAndNotNaN(start) && isNumberAndNotNaN(end)) {
    return [arr, normalizeSingleIdx(start, arrLength), normalizeSingleIdx(end, arrLength)];
  } else if ((typeof(start) !== 'number' || (typeof(start) === 'number' && isNaN(start))) && isNumberAndNotNaN(end)) {
    return [arr, 0, normalizeSingleIdx(end, arrLength)];
  }
}

function assignTwoSliceArgs(arr, idx) {
  var arrLength = arr.length;

  if (typeof(idx) !== 'number' || (typeof(idx) === 'number' && isNaN(idx))) {
    return [arr, 0, arrLength];
  } else {
    return [arr, normalizeSingleIdx(idx, arrLength), arrLength];
  }
}

function emtpyArray(arr) {
  return Array.isArray(arr) && arr.length === 0;
}

function isNumberAndNotNaN(value) {
  return typeof(value) === 'number' && !isNaN(value);
}

function normalizeSingleIdx(idx, arrLength) {
  if (idx >= 0 && idx < arrLength) {
    return idx;
  } else if (idx >= arrLength) {
    return arrLength;
  } else if (idx < 0 && idx >= -arrLength) {
    return idx + arrLength;
  } else {
    return 0;
  }
}

function slice(...args) {
  var arr;
  var start;
  var end;
  var slicedArr = [];

  [arr, start, end] = assignSliceArgs(args);
  for (var i = start; i < end; i += 1) {
    slicedArr.push(arr[i]);
  }

  return slicedArr;
}

function splice(arr, start, deleteCount, ...elements) {
  var newArr = [];

  if (deleteCount > arr.length - start) { deleteCount = arr.length - start; }

  for (var i = start; i < start + deleteCount; i += 1) {
    newArr.push(arr[i]);
  }

  if (emtpyArray(elements)) {
    for (var i = start; i < arr.length; i += 1) {
      arr[i] = arr[i + deleteCount];
    }
    arr.length = arr.length - deleteCount;
  } else {
    if (start === 0 && deleteCount === 0) {
      var lastElementsIndex = elements.length - 1;
      for (var i = lastElementsIndex; i >= 0; i -= 1) {
        arr.unshift(elements[i]);
      }
    } else {
      var numElements = elements.length;
      var lastIndex = start + numElements;
      for (var i = start; i < lastIndex; i += 1 ) {
        arr[i] = elements[i - start];
      }
    }
  }
  return newArr;
}

export { slice, splice };