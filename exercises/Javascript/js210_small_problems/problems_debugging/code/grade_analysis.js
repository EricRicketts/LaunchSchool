function average(nums) {
  var sum = nums.reduce(function(total, num) {
    return total + num;
  });

  return (sum / nums.length);
}

function median(nums) {
  var median;
  var length = nums.length;

  nums.sort();

  if (length % 2 === 0) {
    median = average([nums[(length / 2) - 1], nums[length / 2]]);
  } else {
    median = nums[Math.floor(length / 2)];
  }

  return median;
}

function medianFixed(nums) {
  var median;
  var length = nums.length;

  nums.sort((a, b) => a - b).reverse();

  if (length % 2 === 0) {
    median = average([nums[(length / 2) - 1], nums[length / 2]]);
  } else {
    median = nums[Math.floor(length / 2)];
  }

  return median;
}

export { average, median, medianFixed };
/*
The problem with the original code was two fold:
1.  When the sort function is not given an argument on how to sort, it sorts
assuming the inputs are strings, so I had to make sure it was given a function
which operated on numbers.
2.  Secondly, the sorted numbers had to be sorted in ascending order, just in case
there were not an equal number of lower and higher numbers.
 */