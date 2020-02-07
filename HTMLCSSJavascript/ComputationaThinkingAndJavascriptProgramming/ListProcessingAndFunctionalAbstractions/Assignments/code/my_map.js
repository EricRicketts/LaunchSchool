function myMap(array, func) {
  let transformedArray = [];

  array.forEach(function(element) {
    transformedArray.push(func(element));
  });

  return transformedArray;
}

export { myMap };