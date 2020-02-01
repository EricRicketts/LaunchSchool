/*
sum of sums works like the following say we have an array [3, 5, 2]
sum of sums = (3) + (3 + 5) + (3 + 5 + 2) = 21
we can rewrite as (3 + 3 + 3) + (5 + 5) + (2) = 21
number of appearances for each number = arrayLength - element index
 */
function sumOfSums(array) {
  let arraySize = array.length;

  return array.reduce(function(sum, num, idx) {
    let numberOfAppearances = arraySize - idx;
    sum += num * numberOfAppearances;
    return sum;
 }, 0);
}

function sumOfSumsAlternate(array) {
  let arrayOfSums = [];
  let sum = 0;

  array.forEach(function(num) {
    sum += num;
    arrayOfSums.push(sum);
  });

  return arrayOfSums.reduce((sum, num) => sum + num );
}

function sumOfSumsLaunchSchool(array) {
  return array.map(function(num, idx, ary) {
    return ary.slice(0, idx + 1).reduce((accumulator, value) => accumulator + value, 0);
  }).reduce((sum, number) => sum + number, 0);
}

export { sumOfSums, sumOfSumsAlternate, sumOfSumsLaunchSchool };