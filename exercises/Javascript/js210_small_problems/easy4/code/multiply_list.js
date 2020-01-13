function multiplyList(arr1, arr2) {
  return arr1.map((n, idx) => n*arr2[idx])
}

export { multiplyList };