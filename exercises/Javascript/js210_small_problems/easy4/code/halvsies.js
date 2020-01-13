function halvsies(arr) {
  var firstMaxIdx = Math.ceil(arr.length/2) - 1;
  var firstHalf = [];
  var secondHalf = [];

  arr.forEach(function(n, idx) {
    idx <= firstMaxIdx ? firstHalf.push(n) : secondHalf.push(n);
  });

  return [firstHalf, secondHalf];
}

export { halvsies };