function bubbleSort(arr) {
  let swapCount;
  let arrSize = arr.length;

  do {
   swapCount = 0;
   for (let idx = 0; idx < arrSize; idx += 1) {
     if (idx !== 0) {
       if (arr[idx - 1] > arr[idx]) {
         let temp = arr[idx - 1];
         arr[idx - 1] = arr[idx];
         arr[idx] = temp;
         swapCount += 1;
       }
     }
   }

  } while (swapCount > 0);

  return arr;
}

export { bubbleSort };