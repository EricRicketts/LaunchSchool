function transpose(arr) {
  let [newColNumber, newRowNumber] = [arr.length, arr[0].length];
  let transposedArr = Array.from({length: newRowNumber}, () => new Array(newColNumber).fill(0));

  return transposedArr.map((row, rowIdx) => row.map((_, colIdx) => arr[colIdx][rowIdx]));
}

export { transpose };