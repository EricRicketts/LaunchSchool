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

function splice(params) {
    
}

export { slice, splice };