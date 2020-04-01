function nonEmptyList(arr1, arr2) {
  return arr1.length === 0 ? arr2 : arr1;
}

function oneListIsEmpty(arr1, arr2) {
  return arr1.length === 0 || arr2.length === 0;
}

function sortNumberIn(sortedList, num) {
  let sortedLength = sortedList.length;
  for (let idx = 0; idx < sortedLength; idx += 1) {
    if (idx === sortedLength - 1) {
      if (num <= sortedList[idx]) {
        sortedList.splice(idx, 0, num);
      } else {
        sortedList.push(num);
      }
      break;
    } else if (num >= sortedList[idx] && num <= sortedList[idx + 1]) {
      sortedList.splice(idx + 1, 0, num);
      break;
    } else if (num < sortedList[idx]) {
      sortedList.splice(idx, 0, num);
      break;
    }
  }
}

function merge(arr1, arr2) {
  if (oneListIsEmpty(arr1, arr2)) return nonEmptyList(arr1, arr2);

  let sortedList = arr1.slice();
  let secondList = arr2.slice();

  while (secondList.length > 0) {
    let num = secondList.shift();
    sortNumberIn(sortedList, num);
  }

  return sortedList;
}

export { merge };