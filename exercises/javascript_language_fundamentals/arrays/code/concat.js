function concat(a, ...b) {
  var b = b.flat();
  var concatedArr = [];
  var twoArrs = [a, b];
  
  twoArrs.forEach(arr => {
    arr.forEach(element => {
      concatedArr.push(element);
    });
  });

  return concatedArr;
}

export { concat };