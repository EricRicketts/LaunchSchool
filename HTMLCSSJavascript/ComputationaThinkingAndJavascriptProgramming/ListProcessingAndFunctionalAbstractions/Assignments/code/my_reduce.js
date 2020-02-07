function myReduce(array, func, initialValue) {
  let result, index;

  if (initialValue === undefined) {
    result = array[0];
    index = 1;
  } else {
    result = initialValue;
    index = 0;
  }

  array.slice(index).forEach(function(value) {
    result = func(result, value);
  });

  return result;
}

export { myReduce };