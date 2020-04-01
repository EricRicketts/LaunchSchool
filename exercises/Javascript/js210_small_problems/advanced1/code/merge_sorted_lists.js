function emptyListCase(arr1, arr2) {
  if (arr1.length === 0 && arr2.length > 0) {
    return arr2;
  } else if (arr1.length > 0 && arr2.length === 0) {
    return arr1;
  }
}

function merge(arr1, arr2) {
  if ([arr1.length, arr2.length].includes(0)) {
    return emptyListCase(arr1, arr2);
  }

  let sorted = arr1.slice();
  let second = arr2.slice();

  while (second.length > 0) {
    let sortedLength = sorted.length;
    let num = second.shift();
    for (let idx = 0; idx < sortedLength; idx += 1) {
      if (idx === sortedLength - 1) {
        if (num <= sorted[idx]) {
          sorted.splice(idx, 0, num);
        } else {
          sorted.push(num);
        }
        break;
      } else if (num >= sorted[idx] && num <= sorted[idx + 1]) {
        sorted.splice(idx + 1, 0, num);
        break;
      } else if (num < sorted[idx]) {
        sorted.splice(idx, 0, num);
        break;
      }
    }
  }

  return sorted;
}

export { merge };