function myForEach(array, func) {
  let arrSize = array.length;

  for(let i = 0; i < arrSize; i += 1) {
    func(array[i]);
  }
}

export { myForEach };