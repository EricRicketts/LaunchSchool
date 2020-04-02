import { merge } from "./merge_launch_school";

function isLastIdx(idx, array) {
  return idx === array.length - 1;
}

function mergeSort(arr) {
  let copy = arr.slice();
  let nested = [];

  for (let idx = 0; idx < copy.length; idx += 2) {
    isLastIdx(idx, copy) ? nested.push([[copy[idx]], []]) : nested.push([[copy[idx]], [copy[idx + 1]]]);
  }

  let initialSort = nested.map((arr) => merge(arr[0], arr[1]));
  return initialSort.reduce((sorted, arr) => {
    sorted = merge(sorted, arr);
    return sorted;
  });
}

export { mergeSort };