function sum (...args) {
  return args.reduce(function (sum, num) {
    return sum += num;
  }, 0)
}

function secondAverage (...args) {
  return sum(...args) / args.length;
}


function firstAverage (...args) {
  var sum = args.reduce(function (sum, num) {
    return sum += num;
  }, 0);

  return sum / args.length;
}

function secondSum (arr) {
  var sum = 0;
  for (var i = 0; i < arr.length; i++) {
    sum += arr[i];
  }

  return sum;
}

function thirdAverage (arr) {
  return secondSum(arr) / arr.length;
}

module.exports = {
  firstAverage: firstAverage,
  secondAverage: secondAverage,
  thirdAverage: thirdAverage
}
